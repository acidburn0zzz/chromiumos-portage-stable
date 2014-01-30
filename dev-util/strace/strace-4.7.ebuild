# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/strace/strace-4.7.ebuild,v 1.12 2013/02/19 01:41:17 zmedico Exp $

EAPI="4"

inherit flag-o-matic eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://strace.git.sourceforge.net/gitroot/strace/strace"
	inherit git-2 autotools
else
	SRC_URI="mirror://sourceforge/${PN}/${P}.tar.xz"
	KEYWORDS="*"
fi

DESCRIPTION="A useful diagnostic, instructional, and debugging tool"
HOMEPAGE="http://sourceforge.net/projects/strace/"

LICENSE="BSD"
SLOT="0"
IUSE="static aio"

# strace only uses the header from libaio to decode structs
DEPEND="aio? ( >=dev-libs/libaio-0.3.106 )
	sys-kernel/linux-headers"
RDEPEND=""

src_prepare() {
	if [[ ! -e configure ]] ; then
		# git generation
		eautoreconf
		[[ ! -e CREDITS ]] && cp CREDITS{.in,}
	fi

	epatch "${FILESDIR}"/${P}-glibc-2.15.patch #414637
	epatch "${FILESDIR}"/${P}-x32.patch

	filter-lfs-flags # configure handles this sanely
	use static && append-ldflags -static

	export ac_cv_header_libaio_h=$(usex aio)
}

src_install() {
	default
	dodoc CREDITS
}
