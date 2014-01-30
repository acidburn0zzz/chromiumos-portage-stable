# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-cpp/gmock/gmock-1.6.0.ebuild,v 1.6 2012/08/24 09:23:27 xmw Exp $

EAPI="4"

inherit eutils libtool

DESCRIPTION="Google's C++ mocking framework"
HOMEPAGE="http://code.google.com/p/googlemock/"
SRC_URI="http://googlemock.googlecode.com/files/${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

RDEPEND="=dev-cpp/gtest-${PV}*"
DEPEND="app-arch/unzip
	${RDEPEND}"

src_unpack() {
	default
	# make sure we always use the system one
	rm -r "${S}"/gtest/{Makefile,configure}* || die
}

src_prepare() {
	sed -i -r \
		-e '/^install-(data|exec)-local:/s|^.*$|&\ndisabled-&|' \
		Makefile.in
        epatch "${FILESDIR}/1.6.0-fix_mutex.patch" || die
	elibtoolize
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	dobin scripts/gmock-config
	use static-libs || find "${D}" -name '*.la' -delete
}
