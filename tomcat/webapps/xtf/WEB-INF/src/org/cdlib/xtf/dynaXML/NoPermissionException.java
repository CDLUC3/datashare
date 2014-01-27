package org.cdlib.xtf.dynaXML;


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

/**
 * This exception is thrown when a requestor fails authentication (ie has
 * the wrong password, IP address, etc).
 */
class NoPermissionException extends DynaXMLException 
{
  /**
   * Constructor taking an IP address
   *
   * @param ipAddr    The IP address of the requestor
   */
  public NoPermissionException(String ipAddr) {
    super("Permission denied");
    set("ipAddr", ipAddr);
  }

  /**
   * Constructor that only takes a 'cause'. This is used, for example, when
   * an LDAP authentication attempt fails due to a communication error.
   *
   * @param cause     The exception that caused this exception.
   */
  public NoPermissionException(Throwable cause) {
    super("Permission denied", cause);
  }

  /** Default constructor */
  public NoPermissionException() {
    super("Permission denied");
  }

  /** This particular exception isn't really severe enough to log */
  public boolean isSevere() {
    return false;
  }
} // class NoPermissionException
