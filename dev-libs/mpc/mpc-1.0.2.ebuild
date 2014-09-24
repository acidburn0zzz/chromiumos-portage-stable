# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/mpc/mpc-1.0.2.ebuild,v 1.2 2014/08/10 20:38:23 slyfox Exp $

EAPI="4"

inherit eutils libtool multilib

DESCRIPTION="A library for multiprecision complex arithmetic with exact rounding"
HOMEPAGE="http://mpc.multiprecision.org/"
SRC_URI="http://www.multiprecision.org/mpc/download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

DEPEND=">=dev-libs/gmp-4.3.2
	>=dev-libs/mpfr-2.4.2"
RDEPEND="${DEPEND}"

src_prepare() {
	elibtoolize # for FreeMiNT, bug #347317
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	prune_libtool_files
	dodoc ChangeLog
}

pkg_preinst() {
	preserve_old_lib /usr/$(get_libdir)/libmpc.so.2
}

pkg_postinst() {
	preserve_old_lib_notify /usr/$(get_libdir)/libmpc.so.2
}
