# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/poppler-data/poppler-data-0.4.4.ebuild,v 1.6 2011/10/06 17:40:18 jer Exp $

EAPI="3"

DESCRIPTION="Data files for poppler to support uncommon encodings without xpdfrc"
HOMEPAGE="http://poppler.freedesktop.org/"
SRC_URI="http://poppler.freedesktop.org/${P}.tar.gz"

LICENSE="BSD GPL-2 MIT"
KEYWORDS="*"
SLOT="0"
IUSE=""

src_install() {
	emake prefix="${EPREFIX}"/usr DESTDIR="${D}" install || die
	dodoc README
}
