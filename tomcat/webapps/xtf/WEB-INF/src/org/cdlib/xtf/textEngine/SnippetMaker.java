package org.cdlib.xtf.textEngine;


/**
 * Copyright (c) 2004, Regents of the University of California
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * - Neither the name of the University of California nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
import java.io.IOException;
import java.io.StringReader;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.Token;
import org.apache.lucene.analysis.TokenFilter;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.chunk.DocNumMap;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.mark.ContextMarker;
import org.apache.lucene.mark.MarkCollector;
import org.apache.lucene.mark.MarkPos;
import org.apache.lucene.mark.WordIter;
import org.apache.lucene.search.spans.FieldSpans;
import org.apache.lucene.search.spans.Span;
import org.cdlib.xtf.textIndexer.XTFTextAnalyzer;
import org.cdlib.xtf.util.CharMap;
import org.cdlib.xtf.util.WordMap;

/**
 * Does the heavy lifting of interpreting span hits using the actual document
 * text stored in the index. Marks the hit and any matching terms, and
 * includes a configurable amount of context words.
 *
 * @author Martin Haye
 */
public class SnippetMaker 
{
  /** Lucene index reader used to fetch text data */
  public IndexReader reader;

  /** Lucene analyzer used for tokenizing text */
  private Analyzer analyzer;

  /**
   * Keeps track of which chunks belong to which source document in the
   * index.
   */
  private DocNumMap docNumMap;

  /** Max # of words in an index chunk */
  @SuppressWarnings("unused")
  private int chunkSize;

  /** Amount of overlap between adjacent index chunks */
  private int chunkOverlap;

  /** Set of stop-words removed (e.g. "the", "a", "and", etc.) */
  private Set stopSet;

  /** Plural words to convert to singular */
  private WordMap pluralMap;

  /** Accented chars to remove diacritics from */
  private CharMap accentMap;

  /** 
   * The fields that were specified as tokenized at index time. Not exactly
   * the same as field.isTokenized() because facet values, while tokenized
   * from Lucene's point of view, are not tokenized from the XTF point of
   * view.
   */
  private Set tokFields;
  
  /** Target # of characters to include in the snippet. */
  private int maxContext;

  /** Where to mark terms (all, only in spans, etc.) */
  private int termMode;

  /** List of metadata fields to return in the doc hits, or null for all */
  private Set<String> returnMetaFields;

  // Precompiled patterns for quickly matching common chars special to XML
  private static final Pattern ampPattern = Pattern.compile("&");
  private static final Pattern ltPattern = Pattern.compile("<");
  private static final Pattern gtPattern = Pattern.compile(">");

  /**
   * Constructs a SnippetMaker, ready to make snippets using the given
   * index reader to load text data.
   *
   * @param reader        Index reader to fetch text data from
   * @param docNumMap     Maps chunk numbers to document numbers
   * @param stopSet       Stop words removed (e.g. "the", "a", "and", etc.)
   * @param pluralMap     Plural words to convert to singular
   * @param accentMap     Accented chars to remove diacritics from
   * @param maxContext    Target # chars for hit + context
   * @param termMode      Where to mark terms (all, only in spans, etc.)
   * @param returnMetaFields  Optional comma-delimited subset of fields to return (instead of all by default). 
   */
  public SnippetMaker(IndexReader reader, DocNumMap docNumMap, Set stopSet,
                      WordMap pluralMap, CharMap accentMap, Set tokFields,
                      int maxContext, int termMode, String returnMetaFields) 
  {
    this.reader = reader;
    this.docNumMap = docNumMap;
    this.chunkSize = docNumMap.getChunkSize();
    this.chunkOverlap = docNumMap.getChunkOverlap();
    this.stopSet = stopSet;
    this.pluralMap = pluralMap;
    this.accentMap = accentMap;
    this.tokFields = tokFields;
    this.maxContext = maxContext;
    this.termMode = termMode;
    
    if (returnMetaFields != null)
      this.returnMetaFields = new HashSet(Arrays.asList(returnMetaFields.split("[, ]+")));
    else
      this.returnMetaFields = null;

    // Use the indexer's actual analyzer, so that our results always
    // agree (especially the positions which are critical.)
    //
    analyzer = new XTFTextAnalyzer(null, pluralMap, accentMap);
  } // constructor

  /**
   * Obtain a list of stop-words in the index (e.g. "the", "a", "and",
   * etc.)
   */
  public Set stopSet() {
    return stopSet;
  }

  /**
   * Obtain the set of plural words to convert to singular form.
   */
  public WordMap pluralMap() {
    return pluralMap;
  }

  /**
   * Obtain the set of accented chars to remove diacritics from.
   */
  public CharMap accentMap() {
    return accentMap;
  }

  /** Obtain the document number map used to make snippets */
  public DocNumMap docNumMap() {
    return docNumMap;
  }
  
  /** Obtain the set of tokenized fields */
  public Set tokFields() {
    return tokFields;
  }
  
  /** Obtain the set of fields that should be returned in doc hits (null for all) */
  public Set returnMetaFields() {
    return returnMetaFields;
  }

  /**
   * Full-blown snippet formation process.
   *
   * @param fieldSpans  record of the matching spans, and all search terms
   * @param mainDocNum  document ID of the main doc
   * @param fieldName   name of the field we're making snippets of
   * @param getText     true to get the full text of the snippet, false
   *                    if we only want the start/end offsets.
   */
  public Snippet[] makeSnippets(FieldSpans fieldSpans, int mainDocNum,
                                String fieldName, final boolean getText) 
  {
    // Make a chunked iterator to use for traversing the token stream.
    WordIter wordIter = new XtfChunkedWordIter(reader,
                                               docNumMap,
                                               mainDocNum,
                                               fieldName,
                                               analyzer);

    // Make an array to hold the snippets.
    int nSnippets = fieldSpans.getSpanCount(fieldName);
    final Snippet[] snippets = new Snippet[nSnippets];

    // Process all the marks as they come
    ContextMarker.markField(
      fieldSpans,
      fieldName,
      wordIter,
      getText ? maxContext : 0,
      getText ? termMode : ContextMarker.MARK_NO_TERMS,
      stopSet,
      new MarkCollector() 
      {
        private Snippet curSnippet;
        private MarkPos prevPos = null;
        private StringBuffer buf = getText ? new StringBuffer() : null;

        private void copyUpTo(MarkPos pos) {
          if (prevPos != null)
            buf.append(mapXMLChars(prevPos.getTextTo(pos)));
          prevPos = pos;
        }

        public void beginField(MarkPos pos) {
        }

        public void beginContext(MarkPos pos, Span span) {
          if (getText)
            buf.setLength(0);
          prevPos = pos;
        }

        public void term(MarkPos startPos, MarkPos endPos, String term) 
        {
          if (getText) {
            copyUpTo(startPos);
            buf.append("<term>");
            buf.append(startPos.getTextTo(endPos));
            buf.append("</term>");
          }
          prevPos = endPos;
        }

        public void beginSpan(MarkPos pos, Span span) 
        {
          if (getText) {
            if (maxContext > 0)
              copyUpTo(pos);
            else
              prevPos = pos;
            buf.append("<hit>");
          }
          curSnippet = snippets[span.rank] = new Snippet();
          XtfChunkMarkPos xp = (XtfChunkMarkPos)pos;
          curSnippet.startNode = xp.nodeNumber;
          curSnippet.startOffset = xp.wordOffset;
          curSnippet.sectionType = xp.sectionType;
          curSnippet.rank = span.rank;
          curSnippet.score = span.score;
        }

        public void endSpan(MarkPos pos) 
        {
          if (getText) {
            copyUpTo(pos);
            buf.append("</hit>");
          }
          XtfChunkMarkPos xp = (XtfChunkMarkPos)pos;
          curSnippet.endNode = xp.nodeNumber;
          curSnippet.endOffset = xp.wordOffset;
        }

        public void endContext(MarkPos pos) 
        {
          if (getText) {
            copyUpTo(pos);
            curSnippet.text = buf.toString();
          }
        }

        public void endField(MarkPos pos) {
        }
      });

    // Make sure all the snippets got marked.
    for (int i = 0; i < nSnippets; i++)
      assert snippets[i] != null;

    // And we're done.
    return snippets;
  } // makeSnippets()

  /**
   * Marks all the terms within the given text. Typically used to mark
   * terms within a meta-data field.
   *
   * @param doc        document to get matching spans from
   * @param fieldName  name of the field to mark.
   * @param value      value of the field to mark
   *
   * @return           Marked up text value.
   */
  public String markField(Document doc, FieldSpans fieldSpans,
                          final String fieldName, final String value) 
  {
    try 
    {
      // Get the text, and allocate a buffer for the marked up version.
      final StringBuffer buf = new StringBuffer(value.length() * 2);

      // Now make a word iterator to use for traversing the token stream. While
      // we're at it, strip start/end markers from the tokens.
      //
      TokenStream stream = analyzer.tokenStream(fieldName,
                                                new StringReader(value));
      stream = new StartEndStripper(stream);
      final WordIter wordIter = new BoundedWordIter(value, stream, chunkOverlap);

      // Process all the marks as they come
      ContextMarker.markField(
        fieldSpans,
        fieldName,
        wordIter,
        maxContext,
        termMode,
        stopSet,
        new MarkCollector() 
        {
          private MarkPos prevPos = null;
          private boolean inContext = false;
          private boolean inSpan = false;
          private int contextSize;
          private MarkPos contextStart;

          private void copyUpTo(MarkPos pos) 
          {
            if (prevPos != null) 
            {
              String toAdd = ((BoundedMarkPos)prevPos).getTextTo(pos,
                                                                 inContext ||
                                                                 inSpan);

              // Don't map XML chars here, since the text indexer did it
              // for us.
              //
              buf.append(toAdd);
              if (inContext)
                contextSize += toAdd.length();
            }
            prevPos = pos;
          }

          public void beginField(MarkPos pos) {
            prevPos = pos;
          }

          public void beginContext(MarkPos pos, Span span) 
          {
            copyUpTo(pos);
            buf.append("<snippet rank=\"");
            buf.append(Integer.toString(span.rank + 1));
            buf.append("\" score=\"");
            buf.append(Integer.toString((int)(span.score * 100)));
            buf.append("\">");

            inContext = true;
            contextSize = 0;
            contextStart = pos;
          }

          public void term(MarkPos startPos, MarkPos endPos, String term) {
            copyUpTo(startPos);
            String toAdd = startPos.getTextTo(endPos);
            buf.append("<term>");
            buf.append(toAdd);
            buf.append("</term>");
            if (inContext)
              contextSize += toAdd.length();
            prevPos = endPos;
          }

          public void beginSpan(MarkPos pos, Span span) 
          {
            copyUpTo(pos);
            buf.append("<hit");
            if (!inContext) {
              buf.append(" rank=\"");
              buf.append(Integer.toString(span.rank + 1));
              buf.append("\" score=\"");
              buf.append(Integer.toString((int)(span.score * 100)));
              buf.append("\"");
            }
            buf.append(">");
            inSpan = true;
          }

          public void endSpan(MarkPos pos) {
            copyUpTo(pos);
            buf.append("</hit>");
            inSpan = false;
          }

          public void endContext(MarkPos pos) 
          {
            copyUpTo(pos);
            buf.append("</snippet>");
            if (contextSize > maxContext) 
            {
              @SuppressWarnings("unused")
              int posDiff = contextStart.countTextTo(pos);

              //
              // NOTE: Do NOT re-enable the assert below. Why? Consider
              //       the situation where the matching search terms are
              //       simply very far apart, and there's no way to
              //       make a snippet that contains all of them within
              //       the specified maxContext. I think you still want
              //       the whole hit in this case.       
              //
              //assert false : "ContextMarker made snippet too big";
            }
            inContext = false;
          }

          public void endField(MarkPos pos) {
            copyUpTo(pos);
          }
        });

      String strVal = buf.toString();
      return strVal;
    }
    catch (IOException e) {
      throw new RuntimeException("How could StringReader throw an exception?");
    }
    catch (BoundedMarkPos.UnmarkableException e) {
      // XML structure was found where we can't (yet) figure out how to
      // insert our <snippet> or <hit> elements and still produce a valid
      // XML document. So just return the value unmarked.
      //
      return value;
    }
  } // markField()

  /**
   * Replaces 'special' characters in the given string with their XML
   * equivalent.
   */
  String mapXMLChars(String s) {
    if (s.indexOf('&') >= 0)
      s = ampPattern.matcher(s).replaceAll("&amp;");
    if (s.indexOf('<') >= 0)
      s = ltPattern.matcher(s).replaceAll("&lt;");
    if (s.indexOf('>') >= 0)
      s = gtPattern.matcher(s).replaceAll("&gt;");
    return s;
  } // mapXMLChars()

  /**
   * Strips the special start-of-field/end-of-field markers from tokens.
   */
  public class StartEndStripper extends TokenFilter 
  {
    public StartEndStripper(TokenStream input) {
      super(input);
    }

    /** Retrieve the next token in the stream. */
    public Token next()
      throws IOException 
    {
      Token t = input.next();
      if (t == null)
        return t;

      // If it starts or ends with the special token character, toss it and
      // attach the position increment to the next token.
      //
      String term = t.termText();
      boolean isStartToken = (term.charAt(0) == Constants.FIELD_START_MARKER);
      boolean isEndToken = (term.charAt(term.length() - 1) == Constants.FIELD_END_MARKER);
      if (isStartToken || isEndToken) 
      {
        Token nextTok = input.next();
        assert term.indexOf(nextTok.termText()) >= 0;

        int start = t.startOffset();
        if (isStartToken)
          start++;
        int end = t.endOffset();
        if (isEndToken)
          end--;

        Token newTok = new Token(nextTok.termText(), start, end, nextTok.type());
        newTok.setPositionIncrement(t.getPositionIncrement());
        return newTok;
      }

      return t;
    } // next()
  } // class StartEndStripper
} // class SnippetMaker
