# $NetBSD: Makefile,v 1.15 2021/06/25 11:42:49 adam Exp $

.include "../../net/freeradius/Makefile.module"

PKGNAME=	${DISTNAME:S/-server/-freetds/}
COMMENT=	Free RADIUS FreeTDS support

CONFIGURE_ARGS+=	--with-rlm_sql_freetds
CONFIGURE_ARGS+=	--without-rlm_ldap
CONFIGURE_ARGS+=	--without-rlm_yubikey

do-install:
	${INSTALL_LIB} ${WRKSRC}/build/lib/.libs/rlm_sql_freetds.${SOEXT} \
		${DESTDIR}${PREFIX}/lib

.include "../../databases/freetds/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
