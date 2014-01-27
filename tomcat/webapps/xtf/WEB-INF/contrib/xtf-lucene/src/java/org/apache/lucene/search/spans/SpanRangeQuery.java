package org.apache.lucene.search.spans;


/**
 * Copyright 2004 The Apache Software Foundation
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
import java.util.Vector;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.TermEnum;
import org.apache.lucene.limit.TermLimitException;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searcher;

/**
 * Matches spans containing terms within a specified range.
 */
public class SpanRangeQuery extends SpanQuery 
{
  private int termLimit;
  private Term lowerTerm;
  private Term upperTerm;
  private boolean inclusive;

  /** Limit on the number of terms to report on an error */
  private static final int TERMS_TO_REPORT = 50;

  /** Constructs a span query selecting all terms greater than
   * <code>lowerTerm</code> but less than <code>upperTerm</code>.
   * There must be at least one term and either term may be null,
   * in which case there is no bound on that side, but if there are
   * two terms, both terms <b>must</b> be for the same field.
   */
  public SpanRangeQuery(Term lowerTerm, Term upperTerm, boolean inclusive) {
    this(lowerTerm, upperTerm, inclusive, Integer.MAX_VALUE);
  }

  /** Constructs a span query selecting all terms greater than
   * <code>lowerTerm</code> but less than <code>upperTerm</code>.
   * There must be at least one term and either term may be null,
   * in which case there is no bound on that side, but if there are
   * two terms, both terms <b>must</b> be for the same field. Applies
   * a limit on the total number of terms matched.
   */
  public SpanRangeQuery(Term lowerTerm, Term upperTerm, boolean inclusive,
                        int termLimit) 
  {
    if (lowerTerm == null && upperTerm == null) {
      throw new IllegalArgumentException("At least one term must be non-null");
    }
    if (lowerTerm != null &&
        upperTerm != null &&
        lowerTerm.field() != upperTerm.field()) 
    {
      throw new IllegalArgumentException(
        "Both terms must be for the same field");
    }

    // if we have a lowerTerm, start there. otherwise, start at beginning
    if (lowerTerm != null)
      this.lowerTerm = lowerTerm;
    else
      this.lowerTerm = new Term(upperTerm.field(), "");

    this.upperTerm = upperTerm;
    this.inclusive = inclusive;
    this.termLimit = termLimit;
  }

  /**
   * This method is actually the workhorse of the class. Rewrites the range
   * query as a large span OR query on all of the matching terms.
   */
  public Query rewrite(IndexReader reader)
    throws IOException 
  {
    Vector clauses = new Vector();
    TermEnum enumerator = reader.terms(lowerTerm);
    int nTerms = 0;
    StringBuffer termReport = new StringBuffer(100);

    try 
    {
      boolean checkLower = false;
      if (!inclusive) // make adjustments to set to exclusive
        checkLower = true;

      String testField = getField();

      // Find each matching term, and make a SpanTermQuery for each one.
      do 
      {
        Term term = enumerator.term();
        if (term != null && term.field() == testField) 
        {
          if (!checkLower || term.text().compareTo(lowerTerm.text()) > 0) 
          {
            checkLower = false;
            if (upperTerm != null) 
            {
              int compare = upperTerm.text().compareTo(term.text());
              /* if beyond the upper term, or is exclusive and
               * this is equal to the upper term, break out */
              if ((compare < 0) || (!inclusive && compare == 0))
                break;
            }

            // Enable skipping terms (stop-words, bi-grams, etc.) in derived
            // classes.
            //
            if (shouldSkipTerm(term))
              continue;

            if (nTerms < TERMS_TO_REPORT) {
              termReport.append(term.text());
              termReport.append(" ");
            }

            // If too many terms, throw an exception that contains a clue
            // so the user can make a query that fixes the problem.
            //
            nTerms++;
            if (nTerms == termLimit) {
              throw new TermLimitException(
                "Range query on '" + lowerTerm.field() +
                "' matched too many terms (more than " + termLimit + "). " +
                "First " + TERMS_TO_REPORT + " matches: " +
                termReport.toString());
            }

            SpanTermQuery tq = new SpanTermQuery(term); // found a match
            tq.setBoost(getBoost()); // set the boost
            clauses.add(tq); // add to query
          }
        }
        else {
          break;
        }
      } while (enumerator.next());
    }
    finally {
      enumerator.close();
    }

    // Now form the final query
    SpanQuery[] clauseArray = new SpanQuery[clauses.size()];
    clauses.toArray(clauseArray);
    SpanOrQuery orQuery = new SpanOrQuery(clauseArray);
    orQuery.setSpanRecording(getSpanRecording());
    return orQuery;
  }

  /** Enables derived classes to skip certain terms in the index (e.g. stop
   * words, bi-grams, etc.) Default implementation doesn't skip any terms.
   */
  protected boolean shouldSkipTerm(Term t) {
    return false;
  }

  public Query combine(Query[] queries) {
    return Query.mergeBooleanQueries(queries);
  }

  /** Returns the field name for this query */
  public String getField() {
    return (lowerTerm != null ? lowerTerm.field() : upperTerm.field());
  }

  /** Returns the lower term of this range query */
  public Term getLowerTerm() {
    return lowerTerm;
  }

  /** Returns the upper term of this range query */
  public Term getUpperTerm() {
    return upperTerm;
  }

  /** Returns <code>true</code> if the range query is inclusive */
  public boolean isInclusive() {
    return inclusive;
  }

  /** Returns the term limit, if any, for this range query */
  public int getTermLimit() {
    return termLimit;
  }

  public String toString(String field) 
  {
    StringBuffer buffer = new StringBuffer();
    if (!getField().equals(field)) {
      buffer.append(getField());
      buffer.append(":");
    }
    buffer.append(inclusive ? "[" : "{");
    buffer.append(lowerTerm != null ? lowerTerm.text() : "null");
    buffer.append(" TO ");
    buffer.append(upperTerm != null ? upperTerm.text() : "null");
    buffer.append(inclusive ? "]" : "}");
    if (getBoost() != 1.0f) {
      buffer.append("^");
      buffer.append(Float.toString(getBoost()));
    }
    return buffer.toString();
  }

  /** Should never be called on this query itself, only on the result of
   *  {@link SpanRangeQuery#rewrite(IndexReader)}.
   */
  public Spans getSpans(IndexReader reader, Searcher searcher)
    throws IOException 
  {
    throw new UnsupportedOperationException();
  }

  /** Should never be called on this query itself, only on the result of
   *  {@link SpanRangeQuery#rewrite(IndexReader)}.
   */
  public Collection getTerms() {
    throw new UnsupportedOperationException();
  }
}
