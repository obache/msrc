# $NetBSD: Makefile,v 1.31 2021/06/10 11:06:21 wiz Exp $

DISTNAME=	openmw-0.46.0
PKGREVISION=	8
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_GITHUB:=OpenMW/}
GITHUB_TAG=	openmw-${PKGVERSION_NOREV}

MAINTAINER=	nia@NetBSD.org
HOMEPAGE=	https://openmw.org/
COMMENT=	Recreation of The Elder Scrolls III: Morrowind game engine
LICENSE=	gnu-gpl-v3

USE_CMAKE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	pkg-config

# C++11
GCC_REQD+=	4.8

CMAKE_ARGS+=	-DCMAKE_BUILD_TYPE="Release"
CMAKE_ARGS+=	-DGLOBAL_CONFIG_DIR=${PKG_SYSCONFDIR}

EGDIR=		${PREFIX}/share/examples/openmw

PKG_SYSCONFSUBDIR=	openmw

CONF_FILES+=	${EGDIR}/gamecontrollerdb.txt ${PKG_SYSCONFDIR}/gamecontrollerdb.txt
CONF_FILES+=	${EGDIR}/openmw.cfg ${PKG_SYSCONFDIR}/openmw.cfg
CONF_FILES+=	${EGDIR}/settings-default.cfg ${PKG_SYSCONFDIR}/settings-default.cfg
CONF_FILES+=	${EGDIR}/version ${PKG_SYSCONFDIR}/version

.include "options.mk"
.include "../../archivers/unshield/buildlink3.mk"
.include "../../devel/SDL2/buildlink3.mk"
.include "../../devel/bullet/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/mygui/buildlink3.mk"
.include "../../graphics/osg/buildlink3.mk"
.include "../../audio/openal-soft/buildlink3.mk"
.include "../../multimedia/ffmpeg4/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
