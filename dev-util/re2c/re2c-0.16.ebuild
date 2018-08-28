# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="tool for generating C-based recognizers from regular expressions"
HOMEPAGE="http://re2c.org/"
SRC_URI="https://github.com/skvadrik/re2c/releases/download/${PV}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="*"

src_prepare() {
	epatch_user
	export ac_cv_path_BISON="no"
}

src_install() {
	default

	docompress -x /usr/share/doc/${PF}/{examples,paper}
	dodoc -r README CHANGELOG examples
	docinto paper
	dodoc doc/loplas.ps doc/sample.bib
}
