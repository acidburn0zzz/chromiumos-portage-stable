# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} pypy{,3} )

inherit python-r1

DESCRIPTION="A virtual for the Python concurrent.futures module"
SLOT="0"
KEYWORDS="*"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep 'dev-python/futures[${PYTHON_USEDEP}]' python2_7 pypy)"
