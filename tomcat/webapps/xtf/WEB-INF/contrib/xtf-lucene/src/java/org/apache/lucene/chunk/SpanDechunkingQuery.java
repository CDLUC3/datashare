package org.apache.lucene.chunk;


/**
 * Copyright 2005 The Apache Software Foundation
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
 */
import java.io.IOException;
import java.util.Collection;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.search.Explanation;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searcher;
import org.apache.lucene.search.Similarity;
import org.apache.lucene.search.spans.SpanQuery;
import org.apache.lucene.search.spans.Spans;

/**
 * Wraps a SpanQuery, converting chunk spans to look like they're all part
 * of the main document. Uses a {@link DocNumMap} to find out the mapping
 * from chunks to the main document. The start and end offsets in each span
 * are then multiplied by the chunk offset times the non-overlapping word
 * count per chunk.<p>
 *
 * For instance, say that main document 812 has chunks 813-945. And say that
 * the chunk size is 125 words with an overlap of 25. Spans in chunk 813
 * will have their offsets unchanged; those in 814 will range from 100-199,
 * those in 815 will range from 200-299, etc.<p>
 *
 * <b>Warning:</b> The spans that result from this query might not be in
 * strict start/end order. Thus, this query is only suitable as a top-level
 * span query, and <u>never</u> as part of another span query.
 */
public class SpanDechunkingQuery extends SpanQuery 
{
  private SpanQuery wrapped;
  private DocNumMap docNumMap;

  /** Construct a query that will mark the results of a normal span query.*/
  public SpanDechunkingQuery(SpanQuery wrap) {
    this.wrapped = wrap;
  }

  /** Establish a document number map. Must be called before getSpans(). */
  public void setDocNumMap(DocNumMap docNumMap) {
    this.docNumMap = docNumMap;
  }

  /** Retrieve the SpanQuery being wrapped */
  public SpanQuery getWrapped() {
    return wrapped;
  }

  // inherit javadoc
  public String getField() {
    return wrapped.getField();
  }

  // inherit javadoc
  public Collection getTerms() {
    return wrapped.getTerms();
  }

  // inherit javadoc
  public Query[] getSubQueries() {
    Query[] result = new Query[1];
    result[0] = wrapped;
    return result;
  }

  // inherit javadoc
  public Query rewrite(IndexReader reader)
    throws IOException 
  {
    SpanQuery rewrittenWrapped = (SpanQuery)wrapped.rewrite(reader);
    if (rewrittenWrapped == wrapped)
      return this;
    SpanDechunkingQuery clone = (SpanDechunkingQuery)this.clone();
    clone.wrapped = rewrittenWrapped;
    return clone;
  }

  // inherit javadoc
  public String toString(String field) {
    StringBuffer buffer = new StringBuffer();
    buffer.append("spanDechunk(");
    buffer.append(wrapped.toString(field));
    buffer.append(", spanRecording=");
    buffer.append(getSpanRecording());
    buffer.append(")");
    return buffer.toString();
  }

  // inherit javadoc
  public Spans getSpans(final IndexReader reader, final Searcher searcher)
    throws IOException 
  {
    // Record some parameters for handy access.
    final int chunkSize = docNumMap.getChunkSize();
    final int chunkBump = chunkSize - docNumMap.getChunkOverlap();
    final Similarity similarity = wrapped.getSimilarity(searcher);

    return new Spans() 
    {
      private Spans spans = wrapped.getSpans(reader, searcher);
      private int firstChunk = -1;
      private int lastChunk = -1;
      private int mainDoc = -1;
      private float lengthNorm = 0.0f;
      private int chunkOffset;

      public boolean next()
        throws IOException 
      {
        if (!spans.next())
          return false;

        update();
        return true;
      }

      private void update() 
      {
        // See if we have started a new main document.
        int chunk = spans.doc();
        if (chunk > lastChunk) 
        {
          // Get params for the new main doc.
          mainDoc = docNumMap.getDocNum(chunk);
          if (mainDoc >= 0) {
            firstChunk = docNumMap.getFirstChunk(mainDoc);
            lastChunk = docNumMap.getLastChunk(mainDoc);
            lengthNorm = similarity.lengthNorm(wrapped.getField(),
                                               (lastChunk + 1) - firstChunk);
          }
          else 
          {
            // This can occur if we start reading an index that contains a partially
            // complete document (especially likely with large documents). Just suppress
            // the spans by setting lengthNorm to 0 which will result in zero scores.
            //
            lengthNorm = 0.0f;
            firstChunk = lastChunk = -1;
          }
        }

        // Now calculate an appropriate offset for the current chunk.
        chunkOffset = (chunk - firstChunk) * chunkBump;
      }

      public boolean skipTo(int target)
        throws IOException 
      {
        int first = docNumMap.getFirstChunk(target);
        if (first < 0 || target < first)
          first = target;

        if (!spans.skipTo(first))
          return false;

        update();
        return true;
      }

      public int doc() {
        return mainDoc;
      }

      public int start() {
        int start = spans.start();
        assert start >= 0 && start < chunkSize;
        return start + chunkOffset;
      }

      public int end() {
        int end = spans.end();
        assert end > 0 && end <= chunkSize;
        return end + chunkOffset;
      }

      public float score() {
        return spans.score() * lengthNorm * getBoost();
      }

      public String toString() {
        return "spans(" + SpanDechunkingQuery.this.toString() + ")";
      }

      public Explanation explain()
        throws IOException 
      {
        Explanation result = new Explanation(0,
                                             "weight(" + toString() +
                                             "), product of:");

        Explanation boostExpl = new Explanation(getBoost(), "boost");
        if (boostExpl.getValue() != 1.0f)
          result.addDetail(boostExpl);

        Explanation lengthExpl = new Explanation(lengthNorm, "lengthNorm");
        result.addDetail(lengthExpl);

        Explanation inclExpl = spans.explain();
        result.addDetail(inclExpl);

        result.setValue(
          boostExpl.getValue() * lengthExpl.getValue() * inclExpl.getValue());
        return result;
      }
    };
  }
}
