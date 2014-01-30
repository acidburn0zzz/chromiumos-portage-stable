# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-devel/patch/patch-2.6.1.ebuild,v 1.7 2011/12/03 10:47:41 maekke Exp $

inherit flag-o-matic

DESCRIPTION="Utility to apply diffs to files"
HOMEPAGE="http://www.gnu.org/software/patch/patch.html"
SRC_URI="mirror://gnu/patch/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="static test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? ( sys-apps/ed )"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# this file is missing from the tarball bug #300845
	cp "${FILESDIR}"/gnulib_strnlen.c gl/lib/strnlen.c || die
}

src_compile() {
	use static && append-ldflags -static

	local myconf=""
	[[ ${USERLAND} != "GNU" ]] && myconf="--program-prefix=g"
	econf ${myconf} || die

	emake || die "emake failed"
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc AUTHORS ChangeLog NEWS README
}
