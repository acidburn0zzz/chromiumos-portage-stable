# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy pypy3  )

inherit distutils-r1

DESCRIPTION="Core utilities for Python packages"
HOMEPAGE="https://github.com/pypa/packaging https://pypi.python.org/pypi/packaging"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="|| ( Apache-2.0 BSD-2 )"
KEYWORDS="*"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? (
		dev-python/pretend[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
PDEPEND="dev-python/pyparsing[${PYTHON_USEDEP}]"

python_test() {
	py.test --capture=no --strict -v || die
}

pkg_preinst() {
	# Remove this in the next version bump
	_cleanup() {
		local pyver=$("${PYTHON}" -c "from distutils.sysconfig import get_python_version; print(get_python_version())")
		local egginfo="${ROOT%/}$(python_get_sitedir)/${P}-py${pyver}.egg-info"
		if [[ -d ${egginfo} ]]; then
			echo rm -r "${egginfo}"
			rm -r "${egginfo}" || die "Failed to remove egg-info directory"
		fi
	}
	python_foreach_impl _cleanup
}
