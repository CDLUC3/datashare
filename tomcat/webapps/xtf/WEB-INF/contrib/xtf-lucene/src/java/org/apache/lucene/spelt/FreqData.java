package org.apache.lucene.spelt;

/*
 * Copyright 2006-2007 The Apache Software Foundation.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.lucene.util.Hash64;
import org.apache.lucene.util.IntList;
import org.apache.lucene.util.LongList;

/**
 * A fast, simple, in-memory data structure for holding frequency data used
 * to produce spelling suggestions.
 *
 * @author Martin Haye
 */
class FreqData 
{
  /** List of keys */
  private LongList keys = new LongList();

  /** One count per key */
  private IntList counts = new IntList();

  /** Tracks the section of the data that has been sorted. */
  private int sortTop = 0;

  /** Upper limit on the number of unsorted entries */
  private static final int MAX_UNSORTED = 1000000;

  /** Magic number stored in file when data is written */
  static final long MAGIC_NUM = ((long)'P') << (7 * 8) |
                                ((long)'a') << (6 * 8) |
                                ((long)'i') << (5 * 8) |
                                ((long)'r') << (4 * 8) |
                                ((long)'F') << (3 * 8) |
                                ((long)'r') << (2 * 8) |
                                ((long)'q') << (1 * 8) |
                                ((long)'1') << (0 * 8);

  /** Add a count for a given word */
  public final void add(String word, int count) {
    add(Hash64.hash(word), count);
  }

  /** Add a count for a given word pair */
  public final void add(String word1, String word2, int count) {
    add(Hash64.hash(word1, word2), count);
  }

  /** Add a count for a given hash code and count */
  public void add(long hash, int count) 
  {
    // Check within the sorted section to see if we already have this.
    int pos = searchSorted(hash);
    if (pos >= 0) {
      counts.set(pos, counts.get(pos) + count);
      return;
    }

    // Gotta add a new entry.
    keys.add(hash);
    counts.add(count);

    // Every once in a while, sort and de-dupe to keep our memory footprint
    // reasonable.
    //
    if (keys.size() - sortTop > MAX_UNSORTED)
      sort();
  }

  /** Search within the sorted keys for the given one. */
  private int searchSorted(long hash) 
  {
    int low = 0;
    int high = sortTop - 1;

    while (low <= high) 
    {
      int mid = (low + high) >> 1;
      long probe = keys.get(mid);

      if (probe < hash)
        low = mid + 1;
      else if (probe > hash)
        high = mid - 1;
      else
        return mid;
    }

    return -1;
  }

  /** Get the count for a given word, or zero if not found */
  public final int get(String word) {
    return get(Hash64.hash(word));
  }

  /** Get the count for a given word pair, or zero if not found */
  public final int get(String word1, String word2) {
    return get(Hash64.hash(word1, word2));
  }

  /** Get the count for a given hash code, or zero if not found */
  public final int get(long hash) 
  {
    // Before using binary search, ensure the data is sorted.
    sort();

    // See if we can locate the given hash code.
    int pos = keys.binarySearch(hash);
    if (pos < 0)
      return 0;

    // Got it!
    return counts.get(pos);
  }

  /**
   * Append sorted counts from an input stream that were saved by
   * {@link #save(File)}.
   *
   * @param f             File to load from
   * @throws IOException  if anything goes wrong
   */
  public void add(File f)
    throws IOException 
  {
    int prevSize = keys.size();

    // Open the file
    DataInputStream s = new DataInputStream(
      new BufferedInputStream(new FileInputStream(f)));

    try 
    {
      // Check the magic number
      long magic = s.readLong();
      if (magic != MAGIC_NUM)
        throw new IOException("unrecognized format of frequency data");

      // Find out how many counts are stored, and prepare space for them.
      int numCounts = s.readInt();
      keys.ensureCapacity(keys.size() + numCounts);
      counts.ensureCapacity(keys.size() + numCounts);

      // Read each pair, verify ascending key order, and add it to our lists.
      long prevKey = -1;
      for (int i = 0; i < numCounts; i++) 
      {
        // Read the data
        long key = s.readLong();
        int count = s.readInt();

        // Validate it
        if (key <= prevKey)
          throw new IOException(
            "freq data was not sorted correctly on disk, or file is corrupt");
        prevKey = key;
        if (count < 0)
          throw new IOException("frequency data file is corrupted");

        // And record it
        keys.add(key);
        counts.add(count);
      }

      // If we weren't appending, there's no need to re-sort.
      if (prevSize == 0)
        sortTop = keys.size();
    }
    finally {
      s.close();
    }
  }

  /**
   * Save sorted counts to an input stream. These can later be loaded by
   * {@link #add(File)}.
   *
   * @param f             File to write to (existing contents are replaced)
   * @throws IOException  if anything goes wrong
   */
  public void save(File f)
    throws IOException 
  {
    // Make sure the data is in sorted order
    sort();

    // Open the file
    DataOutputStream s = new DataOutputStream(
      new BufferedOutputStream(new FileOutputStream(f)));

    // Write out the data
    try 
    {
      s.writeLong(MAGIC_NUM);
      s.writeInt(keys.size());
      for (int i = 0; i < keys.size(); i++) {
        s.writeLong(keys.get(i));
        s.writeInt(counts.get(i));
      }
    }
    finally {
      s.close();
    }
  }

  /** If not already sorted, re-sort the data */
  private void sort() 
  {
    // Already sorted, or no data? Forget it.
    if (sortTop == keys.size())
      return;

    // First step: sort both lists.
    final int[] map = keys.calcSortMap();
    keys.remap(map);
    counts.remap(map);

    // Now merge duplicates.
    long key = keys.get(0);
    int count = counts.get(0);
    int dp = 0;
    for (int sp = 1; sp < keys.size(); sp++) 
    {
      final long nextKey = keys.get(sp);
      if (nextKey != key) {
        assert nextKey > key : "calcSortMap didn't work right";
        keys.set(dp, key);
        counts.set(dp, count);
        dp++;
        key = nextKey;
        count = 0;
      }
      count += counts.get(sp);
    }
    
    // Be sure to do the last one.
    keys.set(dp, key);
    counts.set(dp, count);
    dp++;

    // Chop off any unused space caused by merging.
    keys.resize(dp);
    counts.resize(dp);

    // Lastly, remember that we don't have to sort again.
    sortTop = keys.size();
  }
} // class
