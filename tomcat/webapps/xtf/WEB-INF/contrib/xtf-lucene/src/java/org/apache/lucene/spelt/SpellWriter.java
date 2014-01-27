package org.apache.lucene.spelt;

/**
 * Copyright 2006-2007 The Apache Software Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Acknowledgements:
 *
 * A significant amount of new and/or modified code in this module
 * was made possible by a grant from the Andrew W. Mellon Foundation,
 * as part of the Melvyl Recommender Project.
 */

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Set;
import java.util.regex.Pattern;

import org.apache.lucene.util.CountedInputStream;
import org.apache.lucene.util.CountedOutputStream;
import org.apache.lucene.util.FileSorter;
import org.apache.lucene.util.IntList;
import org.apache.lucene.util.ProgressTracker;

/**
 * <p>
 * Writes spelling dictionaries, which can later be used by {@link SpellReader}
 * to obtain spelling suggestions. Provides efficient, high-volume updates 
 * to a spelling correction dictionary. Typical steps for creating a dictionary:
 * </p>
 * <ol>
 *   <li>First, {@linkplain #open(File) open} a new writer.</li>
 *   <li>Repeatedly {@linkplain #queueWord(String) queue} words to be added
 *       to the dictionary. This writes the words and pairs to a simple
 *       disk file.
 *   </li>
 *   <li>Optionally {@linkplain #flushQueuedWords() flush} the queued words,
 *       processing them into a final dictionary.
 *   </li>
 *   <li>Finally, {@linkplain #close()} the writer.
 * </ol>
 * <p>
 * Inspired by and very distantly based on Nicolas Maisonneuve / David Spencer 
 * code.
 * </p>
 *
 * @author Martin Haye
 */
public class SpellWriter 
{
  /** Directory to store the spelling dictionary in */
  private File spellIndexDir;

  /** Set of stop words in use; default is null for no stop set */
  private Set stopSet = null;

  /** File to queue words into */
  private File wordQueueFile;

  /** The previous word queued, or null if none (or a break was queued) */
  private String prevWord;

  /** File to queue words into */
  private File pairQueueFile;

  /** File containing compiled word frequencies */
  private File freqFile;

  /** File containing frequency sample data */
  private File sampleFile;

  /** File containing edit map data */
  private File edmapFile;

  /** File containing compiled pair frequency data */
  private File pairFreqFile;

  /** For writing to the word queue */
  private PrintWriter wordQueueWriter = null;

  /** For writing to the pair queue */
  private PrintWriter pairQueueWriter = null;

  /** How large to make the cache of recently added words */
  private static final int MAX_RECENT_WORDS = 20000;

  /** For counting word frequencies prior to write */
  private HashMap<String, Integer> recentWords = new HashMap<String, Integer>(
    MAX_RECENT_WORDS);

  /** Max # of pairs to hash before flushing */
  private static final int MAX_RECENT_PAIRS = 200000;

  /** For counting pair frequencies prior to write */
  private HashMap<String, Integer> recentPairs = new HashMap<String, Integer>(
    MAX_RECENT_PAIRS);
  
  /** Default minimum word frequency = 2 */
  private static final int DEFAULT_MIN_WORD_FREQ = 2;

  /** Minimum frequency for words to retain */
  private int minWordFreq = DEFAULT_MIN_WORD_FREQ;

  /** Default minimum pair frequency = 2 */
  private static final int DEFAULT_MIN_PAIR_FREQ = 2;

  /** Minimum frequency for pairs to retain */
  private int minPairFreq = DEFAULT_MIN_PAIR_FREQ;

  /** Used for calculating double metaphone keys */
  private static DoubleMetaphone doubleMetaphone = new DoubleMetaphone();

  /** Used for splitting lines delimited with bar */
  Pattern splitPat = Pattern.compile("\\|");

  /** Memory limit for sorting */
  private int SORT_MEM_LIMIT = 100 * 1024 * 1024; // 10 megs per file (2 files)

  /** Character array for forming combo keys */
  private char[] keyChars = new char[4];

  /** String buffer for edmap pairs */
  private StringBuffer edmapBuf = new StringBuffer();

  /**
   * Private constructor -- do not construct directly; rather, use the
   * static {@link #open(File)} method.
   */
  private SpellWriter() {
  }

  /**
   * Creates a SpellWriter, and establishes the directory to store the
   * dictionary in. 
   * 
   * If you want stop-words to be recognized and discarded (especially
   * important if the dictionary will be large), call
   * {@link #setStopwords(Set)} after opening a writer.
   * 
   * The minimum word frequency defaults to 2; if you want to
   * override that, call {@link #setMinWordFreq(int)}.
   *
   * A similar threhold exists for pairs; the minimum pair frequency defaults 
   * to 2; if you want to override that, call {@link #setMinPairFreq(int)}.
   *
   * @param spellIndexDir  Directory in which to store the spelling dictionary
   */
  public static SpellWriter open(File spellIndexDir)
    throws IOException 
  {
    SpellWriter writer = new SpellWriter();
    writer.openInternal(spellIndexDir);
    return writer;
  }

  /**
   * Establishes the directory to store the dictionary in.
   */
  private void openInternal(File spellIndexDir)
    throws IOException 
  {
    this.spellIndexDir = spellIndexDir;

    // Figure out the files we're going to store stuff in
    wordQueueFile = new File(spellIndexDir, "newWords.txt");
    pairQueueFile = new File(spellIndexDir, "newPairs.txt");
    freqFile = new File(spellIndexDir, "words.dat");
    sampleFile = new File(spellIndexDir, "freqSamples.dat");
    edmapFile = new File(spellIndexDir, "edmap.dat");
    pairFreqFile = new File(spellIndexDir, "pairs.dat");

    // If the index directory doesn't exist, make it.
    if (!spellIndexDir.isDirectory()) {
      if (!spellIndexDir.mkdir())
        throw new IOException("Error creating spelling index directory");
    }
  }
  
  /**
   * Establishes a set of stop words (e.g. "the", "and", "a", etc.) to
   * receive special handling. This can significantly decrease the size of
   * the dictionary.
   * 
   * @param set the set of stop words to use
   */
  public void setStopwords(Set set) {
    this.stopSet = set;
  }
  
  /**
   * Establish a minimum word frequency. When the in-memory cache is flushed
   * to disk (every 20,000 words or so) those with a frequency below this
   * threshold will be discarded; those at or above this threshold will be
   * written to the disk queue.
   * 
   * @param freq    the new minimum word frequency
   */
  public void setMinWordFreq(int freq) {
    this.minWordFreq = freq;
  }

  /**
   * Establish a minimum pair frequency. When the in-memory cache is flushed
   * to disk (every 200,000 pairs or so) those with a frequency below this
   * threshold will be discarded; those at or above this threshold will be
   * written to the disk queue.
   * 
   * @param freq    the new minimum pair frequency
   */
  public void setMinPairFreq(int freq) {
    this.minPairFreq = freq;
  }

  /**
   * Closes all files. Does NOT write queued words (they stay queued on
   * disk.)
   */
  public synchronized void close()
    throws IOException 
  {
    closeQueueWriters();
  }

  /** Delete all words in the dictionary (including those queued on disk) */
  public synchronized void clearDictionary()
    throws IOException 
  {
    close();

    wordQueueFile.delete();
    pairQueueFile.delete();
    freqFile.delete();
    sampleFile.delete();
    edmapFile.delete();
    pairFreqFile.delete();

    recentWords.clear();
    recentPairs.clear();
  }
  
  /**
   * Queue the given word. The queue can later be flushed by calling
   * flushQueuedWords(); this is typically put off until the end of an indexing
   * run.
   */
  public synchronized void queueWord(String word)
    throws IOException 
  {
    // Map all words to lower case. That way, we can easily strip out stop
    // words, and we can do case copying when reading the dictionary.
    //
    word = word.toLowerCase();
    
    // If the word is a stop word, for now we simply ignore it. This way, we
    // can still accumulate pair data for words on either side of it.
    //
    if (stopSet != null && stopSet.contains(word))
      return;

    // Do we have a pair?
    if (prevWord != null) 
    {
      // Calculate a key for this pair, and get the current count
      String key = prevWord + "|" + word;
      Integer val = recentPairs.get(key);

      // Increment the count
      if (val == null)
        val = Integer.valueOf(1);
      else
        val = Integer.valueOf(val.intValue() + 1);

      // Store it, and if the hash is full, flush it.
      recentPairs.put(key, val);
      if (recentPairs.size() >= MAX_RECENT_PAIRS)
        flushRecentPairs();
    }

    // Save this word for pairing with the next one.
    prevWord = word;

    // Bump the count for this word.
    Integer val = recentWords.get(word);
    if (val == null)
      val = Integer.valueOf(1);
    else
      val = Integer.valueOf(val.intValue() + 1);

    // Store it, and if the hash is full, flush it.
    recentWords.put(word, val);
    if (recentWords.size() >= MAX_RECENT_WORDS)
      flushRecentWords();
  } // queueWord()

  /**
   * Called to signal a break in the text, to inform the spell checker to avoid
   * pairing the previous word with the next one. This should be called at the
   * start or end of a section or field, and at the start or end of each
   * sentence.
   */
  public void queueBreak() 
  {
    // Suppress pairing until another word comes in
    prevWord = null;
  }

  /**
   * Flush any accumulated pairs, with their counts. For efficiency, skip any
   * pair that appeared only once.
   */
  private void flushRecentPairs()
    throws IOException 
  {
    if (recentPairs.isEmpty())
      return;

    openPairQueueWriter();
    Set<String> keySet = recentPairs.keySet();
    ArrayList<String> list = new ArrayList<String>(keySet);
    Collections.sort(list);
    for (int i = 0; i < list.size(); i++) {
      String key = list.get(i);
      int count = recentPairs.get(key).intValue();
      if (count >= minPairFreq)
        pairQueueWriter.println(key + "|" + count);
    }
    pairQueueWriter.flush();
    recentPairs.clear();
  }

  /**
   * Flush any accumulated words, with their counts.
   */
  private void flushRecentWords()
    throws IOException 
  {
    if (recentWords.isEmpty())
      return;

    openWordQueueWriter();
    Set<String> keySet = recentWords.keySet();
    ArrayList<String> list = new ArrayList<String>(keySet);
    Collections.sort(list);
    for (int i = 0; i < list.size(); i++) {
      String key = list.get(i);
      int count = recentWords.get(key).intValue();
      wordQueueWriter.println(key + "|" + count);
    }
    wordQueueWriter.flush();
    recentWords.clear();
  }

  /** Check if any words are queued for add. */
  public synchronized boolean anyWordsQueued()
    throws IOException 
  {
    closeQueueWriters();
    long queueSize = wordQueueFile.length();
    return queueSize > 1;
  }

  /**
   * Ensures that all words in the queue are written to the dictionary on disk.
   * Note that this can take quite some time; if you want to print out progress
   * messages during the process, use {@link #flushQueuedWords(ProgressTracker)}
   * below.
   */
  public synchronized void flushQueuedWords()
    throws IOException 
  {
    flushQueuedWords(null);
  }
  
  /**
   * Ensures that all words in the queue are written to the dictionary on disk.
   * 
   * @param prog    A tracker that will be called periodically during the
   *                process; generally you'll want to supply one that
   *                prints out progress messages.
   *                If null, no progress will be reported.
   */
  public synchronized void flushQueuedWords(ProgressTracker prog)
    throws IOException 
  {
    closeQueueWriters();
    
    // If no progress messages are desired, use a stub.
    if (prog == null) {
      prog = new ProgressTracker() {
        @Override public void report(int pctDone, String descrip) { }
      };
    }

    // Approximately calculate how much work there is to do, so we can report
    // progress in a rational way.
    //
    ProgressTracker[] phaseProgs = prog.split(
      (freqFile.length() + wordQueueFile.length()) * 10,
      pairQueueFile.length());

    // Phase 1: Accumulate word frequencies
    flushPhase1(phaseProgs[0]);

    // Phase 2: Accumulate pairs into the pair data file
    flushPhase2(phaseProgs[1]);

    // All done.
    prog.progress(100, 100, "Done.", true);
  } // flushQueuedWords()

  /**
   * Performs the word-adding phase of the flush procedure.
   *
   * @throws    IOException if something goes wrong
   */
  private void flushPhase1(ProgressTracker prog)
    throws IOException 
  {
    // If there are no new words to add, skip this phase.
    if (!wordQueueFile.canRead())
      return;

    // Divide the progress into sub-phases: reading word lists, 
    // writing frequency samples, writing frequencies, writing edmap.
    //
    ProgressTracker[] subProgs = prog.split(5, 30, 5, 60);

    // Initial progress message
    ProgressTracker[] wordProgs = subProgs[0].split(freqFile.length(),
                                                    wordQueueFile.length());

    // Read the existing frequency list (if any)
    FileSorter freqSorter = FileSorter.start(spellIndexDir, SORT_MEM_LIMIT);
    readFreqs(freqFile, freqSorter, wordProgs[0]);

    // Add in the new frequencies
    readFreqs(wordQueueFile, freqSorter, wordProgs[1]);

    // And write out the accumulated frequencies (culling entries with low 
    // frequency as we go). Also, we'll start building the edit map.
    //
    File newFreqFile = new File(spellIndexDir, "words.dat.new");
    FileSorter edmapSorter = FileSorter.start(spellIndexDir, SORT_MEM_LIMIT);
    IntList allFreqs = new IntList(10000);
    writeFreqs(newFreqFile, freqSorter, allFreqs, edmapSorter, subProgs[1]);

    // Write out frequency samples for statistical purposes.
    File newSampleFile = new File(spellIndexDir, "freqSamples.dat.new");
    writeFreqSamples(allFreqs, newSampleFile, subProgs[2]);

    // Write out the new edit map.
    File newEdmapFile = new File(spellIndexDir, "edmap.dat.new");
    writeEdMap(edmapSorter, newEdmapFile, subProgs[3]);

    // Clear the queue, and replace the old data files.
    replaceFile(freqFile, newFreqFile);
    replaceFile(sampleFile, newSampleFile);
    replaceFile(edmapFile, newEdmapFile);
    deleteFile(wordQueueFile);
  }

  /**
   * Read an existing frequency file, and add it to a file sorter.
   */
  private void readFreqs(File inFile, FileSorter out, ProgressTracker prog)
    throws IOException 
  {
    // Skip if we can't open the file.
    if (!inFile.canRead())
      return;

    // Read each line, consisting of a word and a count separated by "|"
    CountedInputStream countedIn = new CountedInputStream(
      new FileInputStream(inFile));
    BufferedReader freqReader = new BufferedReader(
      new InputStreamReader(countedIn, "UTF-8"));
    int lineCt = 0;
    while (true) 
    {
      String line = freqReader.readLine();
      if (line == null)
        break;
      out.addLine(line);

      // Report progress every once in a while.
      if ((lineCt++ & 0xfff) == 0)
        prog.progress(countedIn.nRead(), inFile.length(), "Reading word files.");
    }
    freqReader.close();
  }

  /**
   * Write out frequency data, in sorted order.
   */
  private void writeFreqs(final File outFile, final FileSorter freqSorter,
                          final IntList allFreqs, final FileSorter edmapSorter,
                          final ProgressTracker prog)
    throws IOException 
  {
    final BufferedWriter out = new BufferedWriter(new FileWriter(outFile));
    freqSorter.finish(new FileSorter.Output() 
    {
        String curWord = null;
        int curFreq = 0;
        int nProcessed = 0;

        // For each token/frequency pair...
        public void writeLine(String line)
          throws IOException 
        {
          String[] tokens = splitPat.split(line);
          if (tokens.length == 2) 
          {
            // If this is a new word, flush the old one.
            if (!tokens[0].equals(curWord)) {
              if (curWord != null)
                flushWord();
              curWord = tokens[0];
            }

            // Accumulate the frequency (skip if invalid)
            try {
              curFreq += Integer.parseInt(tokens[1]);
            }
            catch (NumberFormatException e) {
            }

            // Report progress every once in a while.
            if ((nProcessed++ & 0xfff) == 0 && nProcessed > 1)
              prog.progress(nProcessed,
                            freqSorter.nLinesAdded(),
                            "Processed " + nProcessed + " words.");
          }
        }

        private void flushWord()
          throws IOException 
        {
          // Skip if the frequency is below our threshold
          if (curFreq < minWordFreq)
            return;

          // Add the frequency to our list of all (for statistics later)
          allFreqs.add(curFreq);

          // Write a line to the final frequency file
          out.append(curWord);
          out.append('|');
          out.append(Integer.toString(curFreq));
          out.append('\n');

          // Add combinations to the edit map.
          addCombos(curWord, edmapSorter);

          // Prepare for the next word.
          curFreq = 0;
        }

        public void close()
          throws IOException 
        {
          out.close();
          
          prog.progress(nProcessed,
                        freqSorter.nLinesAdded(),
                        "Processed " + nProcessed + " words.",
                        true);
        }
      });
  }

  /**
   * Add combinations of the first six letters of the word, capturing all the
   * possibilities that represent an edit distance of 2 or less.
   */
  private void addCombos(String word, FileSorter edMapSorter)
    throws IOException 
  {
    // Add combinations to the edit map
    addCombo(word, edMapSorter, 0, 1, 2, 3);
    addCombo(word, edMapSorter, 0, 1, 2, 4);
    addCombo(word, edMapSorter, 0, 1, 2, 5);
    addCombo(word, edMapSorter, 0, 1, 3, 4);
    addCombo(word, edMapSorter, 0, 1, 3, 5);
    addCombo(word, edMapSorter, 0, 1, 4, 5);
    addCombo(word, edMapSorter, 0, 2, 3, 4);
    addCombo(word, edMapSorter, 0, 2, 3, 5);
    addCombo(word, edMapSorter, 0, 2, 4, 5);
    addCombo(word, edMapSorter, 0, 3, 4, 5);
    if (word.length() > 1) {
      addCombo(word, edMapSorter, 1, 2, 3, 4);
      addCombo(word, edMapSorter, 1, 2, 3, 5);
      addCombo(word, edMapSorter, 1, 2, 4, 5);
      addCombo(word, edMapSorter, 1, 3, 4, 5);
      if (word.length() > 2)
        addCombo(word, edMapSorter, 2, 3, 4, 5);
    }
  }

  /** Add a combination of letters to the edit map */
  private void addCombo(String word, FileSorter edmapSorter, int p0,
                        int p1, int p2, int p3)
    throws IOException 
  {
    edmapBuf.setLength(0);
    edmapBuf.append(comboKey(word, p0, p1, p2, p3));
    edmapBuf.append('|');
    edmapBuf.append(word);
    String line = edmapBuf.toString();
    edmapSorter.addLine(line);
  }

  /** Calculate a key from the given characters of the word. */
  private char[] comboKey(String word, int p0, int p1, int p2, int p3) {
    keyChars[0] = word.length() > p0 ? comboChar(word.charAt(p0)) : ' ';
    keyChars[1] = word.length() > p1 ? comboChar(word.charAt(p1)) : ' ';
    keyChars[2] = word.length() > p2 ? comboChar(word.charAt(p2)) : ' ';
    keyChars[3] = word.length() > p3 ? comboChar(word.charAt(p3)) : ' ';
    return keyChars;
  }

  private char comboChar(char c) {
    if (c >= 0x20 && (c & ~0x7f) == 0)
      return c;
    c = (char)((c & 0x7f) | 0x20);
    return (c == '|') ? '*' : c;
  }

  /** Write term frequency samples to the given file. */
  private void writeFreqSamples(IntList allFreqs, File file,
                                ProgressTracker prog)
    throws IOException 
  {
    // Calculate the mean of the term frequencies
    prog.progress(0, 100, "Sampling frequencies.");
    long totalFreq = 0L;
    for (int i = 0; i < allFreqs.size(); i++)
      totalFreq += allFreqs.get(i);
    double avgFreq = totalFreq / (double)allFreqs.size();

    // Eliminate all at- or below-average frequencies.
    prog.progress(10, 100, "Sampling frequencies.");
    IntList aboveAvgFreqs = new IntList(allFreqs.size() / 2);
    for (int i = 0; i < allFreqs.size(); i++) {
      int freq = allFreqs.get(i);
      if (freq > avgFreq)
        aboveAvgFreqs.add(freq);
    }

    // Sort the array by frequency.
    prog.progress(20, 100, "Sampling frequencies.");
    aboveAvgFreqs.sort();

    // If more than 1000 entries, sample it down.
    final int MAX_SAMPLES = 1000;
    IntList finalFreqs;
    if (aboveAvgFreqs.size() < MAX_SAMPLES)
      finalFreqs = aboveAvgFreqs;
    else 
    {
      finalFreqs = new IntList(MAX_SAMPLES);
      for (int i = 0; i < MAX_SAMPLES; i++) {
        int pos = (int)(((long)i) * aboveAvgFreqs.size() / MAX_SAMPLES);
        finalFreqs.add(aboveAvgFreqs.get(pos));
      }
    }

    // Make sure the very first sample reflects the average
    if (finalFreqs.size() > 0)
      finalFreqs.set(0, (int)avgFreq);

    // Write out the data
    prog.progress(50, 100, "Sampling frequencies.");
    PrintWriter writer = new PrintWriter(new FileWriter(file));
    writer.println(allFreqs.size());
    writer.println(finalFreqs.size());
    for (int i = 0; i < finalFreqs.size(); i++)
      writer.println(finalFreqs.get(i));
    writer.close();

    prog.progress(100, 100, "Sampling frequencies.");
  } // writeFreqSamples()

  /**
   * Write out a prefix-compressed edit-distance map, which also contains
   * term frequencies.
   */
  private void writeEdMap(final FileSorter edmapSorter, final File outFile,
                          final ProgressTracker prog)
    throws IOException 
  {
    final CountedOutputStream outCounted = new CountedOutputStream(
      new BufferedOutputStream(new FileOutputStream(outFile)));
    final Writer out = new OutputStreamWriter(outCounted, "UTF-8");
    
    prog.progress(0, 100, "Building word map.", true);

    // Finish sorting all the edit map entries, group them, and write out the keys.
    final ArrayList<String> edKeys = new ArrayList<String>();
    final IntList sizes = new IntList();
    edmapSorter.finish(new FileSorter.Output() 
      {
        String curKey = null;
        ArrayList<String> curWords = new ArrayList<String>();
        int nWritten = 0;

        public void writeLine(String line)
          throws IOException 
        {
          String[] tokens = splitPat.split(line);
          assert tokens.length == 2 : "invalid edmap line";
          if (!tokens[0].equals(curKey)) {
            if (curKey != null)
              flushKey();
            curKey = tokens[0];
          }
          curWords.add(tokens[1]);

          // Give progress every once in a while.
          if ((nWritten++ & 0xFFF) == 0)
            prog.progress(nWritten,
                          edmapSorter.nLinesAdded(),
                          "Building word map.");
        }

        private void flushKey()
          throws IOException 
        {
          // Write out the condensed key
          long prevPos = outCounted.nWritten();
          condenseEdmapKey(curKey, curWords, out);
          out.flush();

          // Record the key and its size on disk
          edKeys.add(curKey);
          sizes.add((int)(outCounted.nWritten() - prevPos));

          // Clear the word list in preparation for the next word
          curWords.clear();
        }

        public void close() {
        }
      });

    // At the end of the file, write an index of positions.
    long indexPos = outCounted.nWritten();
    out.append("edMap index\n");
    out.append(Integer.toString(edKeys.size()));
    out.append('\n');
    for (int i = 0; i < edKeys.size(); i++) {
      String key = edKeys.get(i);
      out.append(key);
      out.append('|');
      out.append(Integer.toString(sizes.get(i)));
      out.append('\n');
    }

    // And finally, at the very end, write the position of the index.
    String tmp = Long.toString(indexPos);
    while (tmp.length() < 20)
      tmp = " " + tmp;
    out.append(tmp);

    // All done.
    out.close();
  }

  /**
   * Perform prefix compression on a list of words for a single edit map
   * key.
   */
  private void condenseEdmapKey(String key, ArrayList<String> words, 
                                Writer out)
    throws IOException 
  {
    String prev = words.get(0);

    // Write the key and the first word in full
    out.append(key);
    out.append('|');
    out.append(prev);

    // Prefix-compress the list.
    for (int j = 1; j < words.size(); j++) 
    {
      String word = words.get(j);

      // Skip duplicates
      if (word.equals(prev))
        continue;
      
      // Figure out how many characters overlap.
      int k;
      for (k = 0; k < Math.min(prev.length(), word.length()); k++) {
        if (word.charAt(k) != prev.charAt(k))
          break;
      }

      // Write the prefix length and suffix
      out.append('|');
      out.append((char)('0' + k));
      out.append(word.substring(k));

      // Next...
      prev = word;
    }

    // Done with this line. Write it, and record the size.
    out.append('\n');
  }

  /** Attempt to delete (and at least truncate) the given file. */
  private void deleteFile(File file)
    throws IOException 
  {
    // First, simply try to delete it.
    if (file.delete())
      return;

    // Couldn't delete it... at least truncate it.
    FileOutputStream tmp = new FileOutputStream(file);
    tmp.close();
  }

  /** Replace an old file with a new one */
  private void replaceFile(File oldFile, File newFile) 
  {
    // First, try to delete the old one.
    oldFile.delete();

    // Then rename the new one to the old one's name.
    newFile.renameTo(oldFile);
  }

  /**
   * Performs the pair-adding phase of the flush procedure.
   */
  private void flushPhase2(ProgressTracker prog)
    throws IOException 
  {
    // Skip this phase if there are no pairs to add.
    if (!pairQueueFile.canRead())
      return;

    // Read in existing pair data (if any)
    FreqData pairData = new FreqData();
    if (pairFreqFile.canRead())
      pairData.add(pairFreqFile);

    // Open the queue, and put a counter on it so we can give accurate
    // progress messages.
    //
    CountedInputStream queueCounted = new CountedInputStream(
      new FileInputStream(pairQueueFile));
    BufferedReader queueReader = new BufferedReader(
      new InputStreamReader(queueCounted, "UTF-8"));

    // Divide the progress into two sub-phases: read and write
    ProgressTracker[] subProgs = prog.split(90, 10);

    // Process each pair in the queue.
    long fileTotal = pairQueueFile.length();
    int totalAdded = 0;

    try 
    {
      boolean eof = false;
      while (!eof) 
      {
        String line = queueReader.readLine();
        if (line == null) {
          eof = true;
          break;
        }

        // Break up the three components of each line (separated by |)
        String[] tokens = splitPat.split(line);
        if (tokens.length == 3) 
        {
          String word1 = tokens[0];
          String word2 = tokens[1];
          String countTxt = tokens[2];

          try 
          {
            pairData.add(word1, word2, Integer.parseInt(countTxt));
            ++totalAdded;

            // Every 4000 or so words, give some status feedback.
            // Only allocate 90%, leaving 10% for the final write.
            //
            if ((totalAdded & 0xFFF) == 0) {
              long filePos = queueCounted.nRead();
              subProgs[0].progress(filePos + 1,
                                   fileTotal + 1,
                                   "Read " + totalAdded + " pairs.");
            }
          }
          catch (NumberFormatException e) { /*ignore*/
          }
        }
      } // while
      
      subProgs[0].progress(100, 100,
                           "Read " + totalAdded + " pairs.",
                           true);
    }
    finally {
      queueReader.close();
      queueCounted.close();
    }

    // Write out the resulting data and replace the old data file, if any.
    File newPairFreqFile = new File(spellIndexDir, "pairs.dat.new");
    newPairFreqFile.delete();
    subProgs[1].progress(50, 100, "Writing pair data.", true);
    pairData.save(newPairFreqFile);
    if (pairFreqFile.canRead() && !pairFreqFile.delete())
      throw new IOException(
        "Could not delete old pair data file -- permission problem?");
    if (!newPairFreqFile.renameTo(pairFreqFile))
      throw new IOException(
        "Could not rename new pair data file -- permission problem?");

    // Clear out (and try to delete) the queue file.
    FileOutputStream tmp = new FileOutputStream(pairQueueFile);
    tmp.close();
    pairQueueFile.delete();
  }

  /** Opens the word queue writer. */
  private void openWordQueueWriter()
    throws IOException 
  {
    // If already open, skip re-opening.
    if (wordQueueWriter != null)
      return;

    // Open the writers now. Be sure to append if they already exist.
    wordQueueWriter = new PrintWriter(
      new BufferedWriter(
        new OutputStreamWriter(new FileOutputStream(wordQueueFile, true),
                               "UTF-8")));
  }

  /** Opens the pair queue writer. */
  private void openPairQueueWriter()
    throws IOException 
  {
    // If already open, skip re-opening.
    if (pairQueueWriter != null)
      return;

    pairQueueWriter = new PrintWriter(
      new BufferedWriter(
        new OutputStreamWriter(new FileOutputStream(pairQueueFile, true),
                               "UTF-8")));
  } // openQueueWriters()

  /** Closes the queue writers if either are open */
  private void closeQueueWriters()
    throws IOException 
  {
    flushRecentWords();
    if (wordQueueWriter != null) {
      wordQueueWriter.close();
      wordQueueWriter = null;
    }
    flushRecentPairs();
    if (pairQueueWriter != null) {
      pairQueueWriter.close();
      pairQueueWriter = null;
    }
  } // closeQueueWriters()

  public static String calcMetaphone(String word) {
    return doubleMetaphone.doubleMetaphone(word);
  }

  protected void finalize()
    throws Throwable 
  {
    close();
  }
} // class SpellWriter
