# $NetBSD: strip.mk,v 1.6 2018/11/12 13:36:50 jperkin Exp $
#
# Copyright (c) 2005 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This code is derived from software contributed to The NetBSD Foundation
# by Johnny C. Lam.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

#
# Depending on whether _INSTALL_UNSTRIPPED is defined, we cause
# ${TOOLS_DIR}/bin/strip to be either the correct strip tool or a no-op.
#
.if defined(_INSTALL_UNSTRIPPED) || !defined(TOOLS_PLATFORM.strip)
TOOLS_NOOP+=		strip
.else
TOOLS_CREATE+=		strip
TOOLS_PATH.strip=	${TOOLS_PLATFORM.strip}
.endif

#
# Create a special strip-dbg tool for stripping just debug information,
# used by the install-strip-debug target.  Currently requires GNU strip.
#
.if !defined(TOOLS_PLATFORM.gstrip)
TOOLS_NOOP+=		strip-dbg
.else
TOOLS_CREATE+=		strip-dbg
TOOLS_PATH.strip-dbg=	${TOOLS_PLATFORM.gstrip}
TOOLS_ARGS.strip-dbg=	-g
.endif

# Make ${STRIP} and ${STRIP_DBG} call through the PATH so they find the ones
# under ${TOOLS_DIR}.
#
STRIP?=		strip
STRIP_DBG?=	strip-dbg
