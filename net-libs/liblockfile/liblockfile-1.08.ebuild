# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/liblockfile/liblockfile-1.08.ebuild,v 1.7 2010/04/08 19:37:15 jer Exp $

EAPI=2

inherit eutils multilib autotools user

DESCRIPTION="Implements functions designed to lock the standard mailboxes"
HOMEPAGE="http://www.debian.org/"
SRC_URI="mirror://debian/pool/main/libl/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

pkg_setup() {
	enewgroup mail 12
}

src_prepare() {
	epatch "${FILESDIR}"/${PV}-stale_lock.patch
	epatch "${FILESDIR}"/${PN}-1.06-respectflags.patch
	epatch "${FILESDIR}"/${PN}-orphan-file.patch
	eautoreconf
}

src_configure() {
	econf --with-mailgroup=mail --enable-shared
}

src_install() {
	dodir /usr/{bin,include,$(get_libdir)} /usr/share/man/{man1,man3}
	emake ROOT="${D}" install || die
	dodoc README Changelog || die
}
