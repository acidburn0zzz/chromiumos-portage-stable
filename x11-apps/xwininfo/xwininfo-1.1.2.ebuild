# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xwininfo/xwininfo-1.1.2.ebuild,v 1.8 2011/10/03 17:59:17 josejx Exp $

EAPI=4

inherit xorg-2 flag-o-matic

DESCRIPTION="window information utility for X"

KEYWORDS="*"
IUSE=""

RDEPEND=">=x11-libs/libxcb-1.6"
DEPEND="${RDEPEND}
	x11-libs/libX11
	>=x11-proto/xproto-7.0.17"

pkg_setup() {
	# interix has a _very_ old iconv in libc, however, including
	# iconv.h redefines those symbols to libiconv_*, which then
	# are unresolved, as the configure check is old and dumb.
	[[ ${CHOST} == *-interix* ]] &&
		append-libs -liconv
}
