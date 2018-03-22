# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{3,4,5,6} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Easy-to-use Python module for text parsing"
HOMEPAGE="http://pyparsing.wikispaces.com/ https://pypi.python.org/pypi/pyparsing"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="doc examples"

# not contained in the tarball
RESTRICT=test

PATCHES=( "${FILESDIR}"/${P}-distutils.patch )

python_install_all() {
	local HTML_DOCS=( HowToUsePyparsing.html )
	if use doc; then
		HTML_DOCS+=( htmldoc/. )
		dodoc docs/*.pdf
	fi
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}

python_test() {
	${PYTHON} unitTests.py || die
}

pkg_preinst() {
	_remove_egg_info() {
		local pyver="$("${PYTHON}" -c 'import sys; print(sys.version[:3])')"
		local egginfo="${ROOT%/}$(python_get_sitedir)/${P}-py${pyver}.egg-info"
		if [[ -d ${egginfo} ]]; then
			einfo "Removing ${egginfo}"
			rm -r "${egginfo}" || die
		fi
	}
	python_foreach_impl _remove_egg_info
}
