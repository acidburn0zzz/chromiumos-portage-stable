# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils flag-o-matic

DESCRIPTION="Standard GNU compressor"
HOMEPAGE="https://www.gnu.org/software/gzip/"
SRC_URI="mirror://gnu/gzip/${P}.tar.xz
	mirror://gnu-alpha/gzip/${P}.tar.xz
	mirror://gentoo/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="pic static"

PATCHES=(
	"${FILESDIR}/${PN}-1.3.8-install-symlinks.patch"
	"${FILESDIR}/${PN}-1.4-asmv.patch"
)

src_prepare() {
	epatch "${PATCHES[@]}"
}

src_configure() {
	use static && append-flags -static
	# avoid text relocation in gzip
	use pic && export DEFS="NO_ASM"
	econf
}

src_install() {
	default
	docinto txt
	dodoc algorithm.doc gzip.doc

	# keep most things in /usr, just the fun stuff in /
	dodir /bin
	mv "${ED}"/usr/bin/{gunzip,gzip,uncompress,zcat} "${ED}"/bin/ || die
	sed -e "s:${EPREFIX}/usr:${EPREFIX}:" -i "${ED}"/bin/gunzip || die
}
