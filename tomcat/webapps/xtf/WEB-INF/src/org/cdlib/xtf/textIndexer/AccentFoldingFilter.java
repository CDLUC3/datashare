package org.cdlib.xtf.textIndexer;


/*
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
import org.apache.lucene.analysis.Token;
import org.apache.lucene.analysis.TokenFilter;
import org.apache.lucene.analysis.TokenStream;
import org.cdlib.xtf.util.CharMap;

/*
 * This file created on Apr 14, 2005 by Martin Haye
 */

/**
 * Improves query results by converting accented characters to normal
 * characters by removing diacritics.
 *
 * @author Martin Haye
 */
public class AccentFoldingFilter extends TokenFilter 
{
  /** Set of characters to map */
  private CharMap accentMap;

  /**
   * Construct a token stream to remove accents from the input tokens.
   *
   * @param input       Input stream of tokens to process
   * @param accentMap   Map of accented characters to their un-accented
   *                    counterparts.
   */
  public AccentFoldingFilter(TokenStream input, CharMap accentMap) 
  {
    // Initialize the super-class
    super(input);

    // Record the set of words to de-pluralize
    this.accentMap = accentMap;
  } // constructor

  /** Retrieve the next token in the stream. */
  public Token next()
    throws IOException 
  {
    int bumpAccum = 0;
    while (true)
    {
      // Get the next token. If we're at the end of the stream, get out.
      Token t = input.next();
      if (t == null)
        return t;
  
      // Does the word have any accented chars? If not, return it unchanged.
      String term = t.termText();
      String mapped = accentMap.mapWord(term);
      if (mapped == null) {
        if (bumpAccum == 0)
          return t;
        mapped = term; // We have accumulated bump to apply; must make new token.
      }
      
      // Special case: if the term is only combining marks or spaces, skip to the next
      // token. Be sure to retain any position bump though.
      //
      if (mapped.length() == 0) {
        bumpAccum += t.getPositionIncrement() - 1;
        continue;
      }
  
      // Okay, we gotta make a new token that's the same in every respect
      // except the word. If we skipped terms because they were only combining marks
      // or spaces, be sure to include their accumulated position increment.
      //
      Token newToken = new Token(mapped, t.startOffset(), t.endOffset(), t.type());
      newToken.setPositionIncrement(t.getPositionIncrement() + bumpAccum);
      return newToken;
    }
  } // next()
} // class AccentFoldingFilter
