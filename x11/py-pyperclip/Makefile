# $NetBSD: Makefile,v 1.6 2021/02/21 12:54:20 adam Exp $

DISTNAME=	pyperclip-1.8.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	x11 python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pyperclip/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/asweigart/pyperclip
COMMENT=	Python module for cross-platform clipboard functions
LICENSE=	modified-bsd

USE_LANGUAGES=	# none

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} != "Darwin"
DEPENDS+=	xclip-[0-9]*:../../x11/xclip
.endif

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
