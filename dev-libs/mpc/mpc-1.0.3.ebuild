# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/mpc/mpc-1.0.3.ebuild,v 1.1 2015/02/21 12:11:55 blueness Exp $

EAPI="4"

inherit eutils libtool multilib-minimal

DESCRIPTION="A library for multiprecision complex arithmetic with exact rounding"
HOMEPAGE="http://mpc.multiprecision.org/"
SRC_URI="http://www.multiprecision.org/mpc/download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

DEPEND=">=dev-libs/gmp-4.3.2[${MULTILIB_USEDEP},static-libs?]
	>=dev-libs/mpfr-2.4.2[${MULTILIB_USEDEP},static-libs?]"
RDEPEND="${DEPEND}"

src_prepare() {
	elibtoolize #347317
}

multilib_src_configure() {
	ECONF_SOURCE=${S} econf $(use_enable static-libs static)
}

multilib_src_install_all() {
	einstalldocs
	prune_libtool_files
}
