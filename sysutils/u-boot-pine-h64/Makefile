# $NetBSD: Makefile,v 1.10 2021/06/21 14:05:12 nia Exp $

UBOOT_TARGET=		pine-h64
UBOOT_CONFIG=		pine_h64_defconfig
UBOOT_BIN=		u-boot-sunxi-with-spl.bin

UBOOT_INSTALLBOOT_PLIST=	installboot.plist

UBOOT_VERSION=		2021.01
PKGREVISION=		0

TOOL_DEPENDS+=		${PYPKGPREFIX}-setuptools-[0-9]*:../../devel/py-setuptools

post-extract:
	${CP} ${PREFIX}/share/arm-trusted-firmware/sun50i-h6/bl31.bin ${WRKSRC}

.include "../../sysutils/arm-trusted-firmware-sun50i-h6/buildlink3.mk"
.include "../../sysutils/u-boot/u-boot-arm64.mk"
