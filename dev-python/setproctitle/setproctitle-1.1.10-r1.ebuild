# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
# pypy doesn't get started in test run. Still required by www-servers/gunicorn
PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} pypy )

inherit distutils-r1 toolchain-funcs

DESCRIPTION="Allow customization of the process title"
HOMEPAGE="https://github.com/dvarrazzo/py-setproctitle"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

# Required for re-write of test suite
DISTUTILS_IN_SOURCE_BUILD=1

python_compile_all() {
	# Make a nice html file
	rst2html.py README.rst > README.html
	# The README.rst will be duplicated in src_install
	rm README.rst || die
}

python_test() {
	# The suite via the Makefile appears to not cater to pypy
	[[ ${EPYTHON} =~ pypy ]] && return

	# prepare embedded executable
	emake \
		CC="$(tc-getCC)" \
		PYINC="$(python_get_CFLAGS)" \
		PYLIB="$(python_get_LIBS)" \
		check
}
