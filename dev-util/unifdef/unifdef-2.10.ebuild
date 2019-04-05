# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit toolchain-funcs

DESCRIPTION="remove #ifdef'ed lines from a file while otherwise leaving the file alone"
HOMEPAGE="http://dotat.at/prog/unifdef/"
SRC_URI="http://dotat.at/prog/unifdef/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"

DOCS=( README )

src_prepare() {
	sed -i '/^prefix/s:=.*:=/usr:' Makefile || die
	tc-export CC
}
