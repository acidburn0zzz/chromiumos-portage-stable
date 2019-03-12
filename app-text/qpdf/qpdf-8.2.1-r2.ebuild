# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Command-line tool for structural, content-preserving transformation of PDF files"
HOMEPAGE="http://qpdf.sourceforge.net/"
SRC_URI="mirror://sourceforge/qpdf/${P}.tar.gz"

LICENSE="|| ( Apache-2.0 Artistic-2 )"

# subslot = libqpdf soname version
SLOT="0/21"

KEYWORDS="*"
IUSE="doc examples perl static-libs test"

CDEPEND="
	sys-libs/zlib
	virtual/jpeg:0=
"
DEPEND="${CDEPEND}
	test? (
		sys-apps/diffutils
		media-libs/tiff
		app-text/ghostscript-gpl[tiff]
	)
"
# Only need perl for the installed tools.
RDEPEND="${CDEPEND}
	perl? ( >=dev-lang/perl-5.8 )
"

DOCS=( ChangeLog README.md TODO )

src_configure() {
	eautoreconf
	local myeconfargs=(
		$(use_enable static-libs static)
		$(use_enable test test-compare-images)
	)
	CONFIG_SHELL=/bin/bash econf "${myeconfargs[@]}"
}

src_install() {
	default

	if ! use perl ; then
		rm "${ED%/}"/usr/bin/fix-qdf || die
		rm "${ED%/}"/usr/share/man/man1/fix-qdf.1 || die
	fi

	if use examples ; then
		dobin examples/build/.libs/*
	fi

	find "${ED}" -name '*.la' -exec rm -f {} +
}
