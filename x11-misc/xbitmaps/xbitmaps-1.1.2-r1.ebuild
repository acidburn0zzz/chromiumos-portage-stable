# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="X.Org bitmaps data"
HOMEPAGE="https://www.x.org/wiki/"
SRC_URI="https://www.x.org/releases/individual/data/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
# there is nothing to compile for this package, all its contents are produced by
# configure. the only make job that matters is make install
src_compile() { true; }
