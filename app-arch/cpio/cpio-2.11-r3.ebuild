# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/cpio/cpio-2.11-r3.ebuild,v 1.7 2015/01/16 08:08:14 ago Exp $

EAPI="5"

inherit autotools eutils

DESCRIPTION="A file archival tool which can also read and write tar files"
HOMEPAGE="http://www.gnu.org/software/cpio/cpio.html"
SRC_URI="mirror://gnu/cpio/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="nls"

src_prepare() {
	epatch "${FILESDIR}"/${P}-stat.patch #328531
	epatch "${FILESDIR}"/${P}-no-gets.patch #424974
	epatch "${FILESDIR}"/${P}-non-gnu-compilers.patch #275295
	epatch "${FILESDIR}"/${P}-security.patch #530512 #536010
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable nls) \
		--bindir="${EPREFIX}"/bin \
		--with-rmt="${EPREFIX}"/usr/sbin/rmt
}

src_install() {
	default
	rm "${ED}"/usr/share/man/man1/mt.1 || die
}
