# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6,3_7} pypy{,3} )
inherit distutils-r1

DESCRIPTION="BLAKE2 hash function extension module"
HOMEPAGE="https://github.com/dchest/pyblake2 https://pypi.org/project/pyblake2/"
SRC_URI="mirror://pypi/${PN::1}/${PN}/${P}.tar.gz"

# pyblake2 itself allows more licenses but blake2 allows the following three
LICENSE="|| ( CC0-1.0 openssl Apache-2.0 )"
SLOT="0"
KEYWORDS="*"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	"${EPYTHON}" test/test.py || die "Tests fail with ${EPYTHON}"
}
