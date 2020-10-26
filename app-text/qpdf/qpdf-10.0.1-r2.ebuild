# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Command-line tool for structural, content-preserving transformation of PDF files"
HOMEPAGE="http://qpdf.sourceforge.net/"
SRC_URI="mirror://sourceforge/qpdf/${P}.tar.gz"

LICENSE="|| ( Apache-2.0 Artistic-2 )"

# subslot = libqpdf soname version
SLOT="0/28"

KEYWORDS="*"
IUSE="doc examples libressl ssl static-libs test"

RESTRICT="!test? ( test )"

RDEPEND="
	net-libs/gnutls:0=
	sys-libs/zlib
	virtual/jpeg:0=
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)
"
DEPEND="${RDEPEND}
	test? (
		sys-apps/diffutils
		media-libs/tiff
		app-text/ghostscript-gpl[tiff]
	)
"

DOCS=( ChangeLog README.md TODO )

src_prepare() {
	default
	eautoreconf
	# from autogen.sh: regenerate the checksums
	rm -f m4/*~ 2>/dev/null || true
	sha256sum configure.ac aclocal.m4 libqpdf/qpdf/qpdf-config.h.in m4/* >| autofiles.sums
}

src_configure() {
	local myeconfargs=(
		--disable-implicit-crypto
		--enable-crypto-gnutls
		--enable-crypto-native
		--with-default-crypto=gnutls
		$(use_enable ssl crypto-openssl)
		$(use_enable static-libs static)
		$(use_enable test test-compare-images)
	)
	CONFIG_SHELL="/bin/bash" econf "${myeconfargs[@]}"
}

src_install() {
	default

	if use examples ; then
		dobin examples/build/.libs/*
	fi

	find "${ED}" -type f -name '*.la' -delete || die
}
