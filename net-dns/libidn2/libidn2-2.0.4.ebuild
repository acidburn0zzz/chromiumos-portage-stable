# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils flag-o-matic multilib-minimal

DESCRIPTION="An implementation of the IDNA2008 specifications (RFCs 5890, 5891, 5892, 5893)"
HOMEPAGE="https://www.gnu.org/software/libidn/#libidn2 https://gitlab.com/jas/libidn2"
SRC_URI="
	mirror://gnu/libidn/${P}.tar.gz
"

LICENSE="GPL-2+ LGPL-3+"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

RDEPEND="
	dev-libs/libunistring[${MULTILIB_USEDEP}]
"
DEPEND="
	${RDEPEND}
	dev-lang/perl
	sys-apps/help2man
"

src_prepare() {
	default

	if [[ ${CHOST} == *-darwin* ]] ; then
		# Darwin ar chokes when TMPDIR doesn't exist (as done for some
		# reason in the Makefile)
		sed -i -e '/^TMPDIR = /d' Makefile.in || die
		export TMPDIR="${T}"
	fi

	multilib_copy_sources
}

multilib_src_configure() {
	econf \
		$(use_enable static-libs static) \
		--disable-doc \
		--disable-gtk-doc
}

multilib_src_install() {
	default

	prune_libtool_files
}
