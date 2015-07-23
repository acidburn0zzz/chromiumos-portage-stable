# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libX11/libX11-1.6.0.ebuild,v 1.1 2013/06/04 12:50:51 chithanh Exp $

EAPI=4

XORG_DOC=doc
# needs automake-1.13 without eautoreconf
XORG_EAUTORECONF=yes
XORG_MULTILIB=yes
inherit xorg-2 toolchain-funcs

DESCRIPTION="X.Org X11 library"

KEYWORDS="*"
IUSE="ipv6 test"

RDEPEND=">=x11-libs/libxcb-1.8.1
	x11-libs/xtrans
	>=x11-proto/xproto-7.0.17
	x11-proto/xf86bigfontproto
	x11-proto/inputproto
	x11-proto/kbproto
	x11-proto/xextproto"
DEPEND="${RDEPEND}
	test? ( dev-lang/perl )"

PATCHES=(
	"${FILESDIR}"/${PN}-1.1.4-aix-pthread.patch
	"${FILESDIR}"/${PN}-1.1.5-winnt-private.patch
	"${FILESDIR}"/${PN}-1.1.5-solaris.patch
)

src_configure() {
	XORG_CONFIGURE_OPTIONS=(
		$(use_with doc xmlto)
		$(use_enable doc specs)
		$(use_enable ipv6)
		--without-fop
	)

	[[ ${CHOST} == *-interix* ]] && export ac_cv_func_poll=no
	xorg-2_src_configure
}

src_compile() {
	if tc-is-cross-compiler; then
		# Make sure the build-time tool "makekeys" uses build settings.
		tc-export_build_env BUILD_CC
		emake -C "${AUTOTOOLS_BUILD_DIR}"/src/util \
			CC="${BUILD_CC}" \
			CFLAGS="${BUILD_CFLAGS}" \
			LDFLAGS="${BUILD_LDFLAGS}" \
			clean all
	fi
	xorg-2_src_compile
}
