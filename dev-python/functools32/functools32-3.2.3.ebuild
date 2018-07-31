# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1

DESCRIPTION="Backport of the functools module from Python 3"
HOMEPAGE="https://pypi.org/project/functools32/ https://github.com/MiCHiLU/python-functools32"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}-2.tar.gz"

SLOT="0"
LICENSE="PSF-2.4"
KEYWORDS="*"
IUSE=""

S="${WORKDIR}"/${P}-2

python_test(){
	"${PYTHON}" test_functools32.py || die
}
