# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/less/less-457.ebuild,v 1.16 2013/09/05 09:51:51 vapier Exp $

EAPI="4"

inherit eutils

CODE2COLOR_PV="0.2"
CODE2COLOR_P="code2color-${CODE2COLOR_PV}"
DESCRIPTION="Excellent text file viewer"
HOMEPAGE="http://www.greenwoodsoftware.com/less/"
SRC_URI="http://www.greenwoodsoftware.com/less/${P}.tar.gz
	http://www-zeuthen.desy.de/~friebel/unix/less/code2color -> ${CODE2COLOR_P}"

LICENSE="|| ( GPL-3 BSD-2 )"
SLOT="0"
KEYWORDS="*"
IUSE="pcre unicode"

DEPEND=">=app-misc/editor-wrapper-3
	>=sys-libs/ncurses-5.2
	pcre? ( dev-libs/libpcre )"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${P}.tar.gz
	cp "${DISTDIR}"/${CODE2COLOR_P} "${S}"/code2color || die
}

src_prepare() {
	epatch "${FILESDIR}"/${CODE2COLOR_P}.patch
}

src_configure() {
	export ac_cv_lib_ncursesw_initscr=$(usex unicode)
	export ac_cv_lib_ncurses_initscr=$(usex !unicode)
	econf \
		--with-regex=$(usex pcre pcre posix) \
		--with-editor="${EPREFIX}"/usr/libexec/editor
}

src_install() {
	default

	dobin code2color
	newbin "${FILESDIR}"/lesspipe.sh lesspipe
	dosym lesspipe /usr/bin/lesspipe.sh
	newenvd "${FILESDIR}"/less.envd 70less

	dodoc "${FILESDIR}"/README.Gentoo
}

pkg_postinst() {
	elog "lesspipe offers colorization options.  Run 'lesspipe -h' for info."
}
