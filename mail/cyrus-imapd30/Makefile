# $NetBSD$

DISTNAME=	cyrus-imapd-3.0.15
CATEGORIES=	mail
MASTER_SITES=	https://github.com/cyrusimap/cyrus-imapd/releases/download/${DISTNAME}/

HOMEPAGE=	http://www.cyrusimap.org/
COMMENT=	Cyrus IMAP server
#LICENSE=	original-bsd # like license

USE_TOOLS+=		gmake perl pax perl:run pkg-config
GNU_CONFIGURE=		yes
PERL5_CONFIGURE=	no
USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes

BUILD_DEFS+=		VARBASE

PKGCONFIG_OVERRIDE+=	libcyrus.pc.in
PKGCONFIG_OVERRIDE+=	libcyrus_imap.pc.in
PKGCONFIG_OVERRIDE+=	libcyrus_min.pc.in
PKGCONFIG_OVERRIDE+=	libcyrus_sieve.pc.in

.include "../../mk/bsd.prefs.mk"

# CYRUS_USER		username of the Cyrus administrator
# CYRUS_GROUP		group of the Cyrus administrator
#
CYRUS_USER?=		cyrus
CYRUS_GROUP?=		mail

BUILD_DEFS+=		CYRUS_USER CYRUS_GROUP
FILES_SUBST+=		CYRUS_USER=${CYRUS_USER}
FILES_SUBST+=		CYRUS_GROUP=${CYRUS_GROUP}

CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--libexecdir=${PREFIX}/libexec/cyrus
CONFIGURE_ARGS+=	--with-cyrus-user=${CYRUS_USER}
CONFIGURE_ARGS+=	--with-pidfile=${VARBASE}/run/cyrus-master.pid
CONFIGURE_ARGS+=	--with-openssl=${SSLBASE:Q}
CONFIGURE_ARGS+=	--with-sasl=${BUILDLINK_PREFIX.cyrus-sasl}
CONFIGURE_ARGS+=	--with-perl=${PERL5:Q}
CONFIGURE_ARGS+=	--with-libwrap=${BUILDLINK_PREFIX.tcp_wrappers}
CONFIGURE_ENV+=		ac_cv_lib_wrap_request_init=yes

CONFIGURE_ARGS+=	--enable-idled
CONFIGURE_ARGS+=	--enable-http
CONFIGURE_ARGS+=	--enable-murder
CONFIGURE_ARGS+=	--enable-nntp
CONFIGURE_ARGS+=	--enable-replication

CONFIGURE_ARGS+=	andrew_cv_runpath_switch=${COMPILER_RPATH_FLAG}

.include "options.mk"

MAKE_ENV+=		PERL=${PERL5:Q}

DOCDIR=			${PREFIX}/share/doc/cyrus-imapd
CONF_FILES=		${DOCDIR}/examples/imapd_conf/normal.conf ${PKG_SYSCONFDIR}/imapd.conf
CONF_FILES+=		${DOCDIR}/examples/cyrus_conf/normal.conf ${PKG_SYSCONFDIR}/cyrus.conf
RCD_SCRIPTS=		cyrus
FILES_SUBST+=		IMAPDCONF=${PKG_SYSCONFDIR}/imapd.conf

REPLACE_PERL+=		tools/rehash
REPLACE_PERL+=		perl/annotator/Daemon.pm
INSTALL_MAKE_FLAGS+=	INSTALLDIRS=vendor

PERL5_PACKLIST= \
	auto/Cyrus/Annotator/Daemon/.packlist		\
	auto/Cyrus/IMAP/.packlist			\
	auto/Cyrus/SIEVE/managesieve/.packlist

.include "../../lang/perl5/module.mk"
BUILDLINK_API_DEPENDS.cyrus-sasl+=	cyrus-sasl>=2.1.17
.include "../../security/cyrus-sasl/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../security/tcp_wrappers/buildlink3.mk"

# Only imap/mupdate needs to be build with pthreads support, so selectively
# enable it via patches for just that one program.
#
.include "../../mk/pthread.buildlink3.mk"

# Change references of some manpages from foo.8 to cyrus-foo.8 to avoid
# manpage conflicts with other packages.  Also change references to
# "/etc/{cyrus,imapd}.conf" into "${PKG_SYSCONFDIR}/{cyrus,imapd}.conf".
#
post-patch:
	cd ${WRKSRC}/man;						\
	set --	deliver 8 fetchnews 8 httpd 8 idled 8 imapd 8 lmtpd 8	\
		master 8 nntpd 8 notifyd 8 pop3d 8 quota 8;		\
	while [ $$# -gt 0 ]; do						\
		man=$$1.$$2;						\
		for file in ../Makefile.in *.[0-9]; do			\
			sed	-e "s|\(man\)/\($$man\)|\1/cyrus-\2|g" \
				-e "s|\(\\\fB\)\($$1($$2)\\\fR\)|\1cyrus-\2|g" \
				$$file > $$file.fixed;			\
			mv -f $$file.fixed $$file;			\
		done;							\
		if [ -f $$man ]; then					\
			mv $$man cyrus-$$man;			\
		fi;							\
		shift 2;						\
	done
	find ${WRKSRC} -type f -print |					\
	xargs -n 1 ${GREP} -l -e /etc/imapd\.conf -e /etc/cyrus\.conf | \
	while read file; do						\
		sed	-e "s|/etc/\(cyrus\.conf\)|${PKG_SYSCONFDIR}/\1|g" \
			-e "s|/etc/\(imapd\.conf\)|${PKG_SYSCONFDIR}/\1|g" \
			$${file} > $${file}.fixed;			\
		mv -f $${file}.fixed $${file};			\
	done

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/tools/masssievec ${DESTDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/tools/mkimap ${DESTDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/tools/mknewsgroups ${DESTDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/tools/translatesieve ${DESTDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/tools/rehash ${DESTDIR}${PREFIX}/bin
	${INSTALL_DATA_DIR} ${DESTDIR}${DOCDIR}
	cd ${WRKSRC}/doc; \
		pax -rwpp . ${DESTDIR}${DOCDIR};

.include "../../devel/zlib/buildlink3.mk"
CONFIGURE_ARGS+=	--with-zlib=${BUILDLINK_PREFIX.zlib}
.include "../../textproc/jansson/buildlink3.mk"
.include "../../textproc/icu/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
