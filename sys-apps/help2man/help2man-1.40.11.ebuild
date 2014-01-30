# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/help2man/help2man-1.40.11.ebuild,v 1.7 2012/08/26 17:32:47 armin76 Exp $

EAPI=4
inherit eutils

DESCRIPTION="GNU utility to convert program --help output to a man page"
HOMEPAGE="http://www.gnu.org/software/help2man/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="nls elibc_glibc"

RDEPEND="dev-lang/perl
	elibc_glibc? ( nls? (
		dev-perl/Locale-gettext
	) )"
DEPEND=${RDEPEND}

DOCS="debian/changelog NEWS README THANKS" #385753

src_prepare() {
	epatch \
		"${FILESDIR}"/${PN}-1.36.4-respect-LDFLAGS.patch \
		"${FILESDIR}"/${PN}-1.38.4-linguas.patch
}

src_configure() {
	local myconf
	use elibc_glibc \
		&& myconf="${myconf} $(use_enable nls)" \
		|| myconf="${myconf} --disable-nls"
	econf ${myconf}
}
