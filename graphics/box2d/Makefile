# $NetBSD: Makefile,v 1.1 2021/02/06 06:41:33 ryoon Exp $

GITHUB_PROJECT=	box2d
GITHUB_TAG=	v${PKGVERSION_NOREV}
DISTNAME=	box2d-2.4.1
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GITHUB:=erincatto/}

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	https://github.com/erincatto/box2d/
COMMENT=	2D physics engine for games
LICENSE=	mit

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

CMAKE_ARGS+=	-DBOX2D_BUILD_TESTBED=OFF
CMAKE_ARGS+=	-DBUILD_SHARED_LIBS=ON

.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXcursor/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../x11/libXinerama/buildlink3.mk"
.include "../../x11/libXrandr/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
