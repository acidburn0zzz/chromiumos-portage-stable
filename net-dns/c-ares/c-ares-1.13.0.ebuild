# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools eutils multilib-minimal

DESCRIPTION="C library that resolves names asynchronously"
HOMEPAGE="http://c-ares.haxx.se/"
SRC_URI="http://${PN}.haxx.se/download/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="*"
IUSE="static-libs"

# Subslot = SONAME of libcares.so.2
SLOT="0/2"

DOCS=( AUTHORS CHANGES NEWS README.md RELEASE-NOTES TODO )

MULTILIB_WRAPPED_HEADERS=(
	/usr/include/ares_build.h
)

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.12.0-remove-tests.patch
	eautoreconf
}

multilib_src_configure() {
	ECONF_SOURCE=${S} \
	econf \
		--enable-nonblocking \
		--enable-symbol-hiding \
		$(use_enable static-libs static)
}

multilib_src_install_all() {
	einstalldocs
	prune_libtool_files --all
}