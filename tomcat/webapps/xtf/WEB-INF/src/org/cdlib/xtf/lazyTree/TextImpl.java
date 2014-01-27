package org.cdlib.xtf.lazyTree;


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
import java.nio.CharBuffer;
import org.cdlib.xtf.util.PackedByteBuf;
import net.sf.saxon.event.Receiver;
import net.sf.saxon.trans.XPathException;
import net.sf.saxon.type.Type;

/**
 * A simple text node, which knows how to load its text from the persistent
 * disk file.
 *
 * @author Martin Haye
 */
class TextImpl extends NodeImpl 
{
  protected String text;

  /** Initialize the text node, and load the text. */
  public void init(int textOffset, int textLen)
    throws IOException 
  {
    if (textLen > 0) {
      byte[] bytes = new byte[textLen];
      document.textFile.seek(textOffset);
      document.textFile.read(bytes);
      PackedByteBuf buf = new PackedByteBuf(bytes);
      text = buf.readString();
    }
  }

  /**
   * Return the character value of the node.
   * @return the string value of the node
   */
  public String getStringValue() {
    return text;
  }

  /**
   * Return the type of node.
   * @return Type.TEXT
   */
  public final int getNodeKind() {
    return Type.TEXT;
  }

  /**
   * Copy this node to a given outputter
   */
  public void copy(Receiver out, int whichNamespaces, boolean copyAnnotations,
                   int locationId)
    throws XPathException 
  {
    out.characters(CharBuffer.wrap(text), locationId, 0);
  }
} // class TextImpl
