# $NetBSD: Makefile,v 1.37 2021/04/21 11:40:24 adam Exp $

DISTNAME=	kiconthemes-${KF5VER}
PKGREVISION=	1
CATEGORIES=	graphics

HOMEPAGE=	https://community.kde.org/Frameworks
COMMENT=	Support for icon themes
LICENSE=	gnu-lgpl-v2.1

.include "../../meta-pkgs/kde/kf5.mk"

USE_TOOLS+=	msgmerge

.include "../../lang/python/tool.mk"
.include "../../archivers/karchive/buildlink3.mk"
.include "../../x11/kconfigwidgets/buildlink3.mk"
.include "../../x11/kitemviews/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../x11/qt5-qttools/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
