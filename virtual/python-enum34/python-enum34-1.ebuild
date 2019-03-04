# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} pypy pypy3 )

inherit python-r1

DESCRIPTION="A virtual for Python enum34 module"
SLOT="0"
KEYWORDS="*"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep 'dev-python/enum34[${PYTHON_USEDEP}]' \
	'python2*' python3_3 'pypy*')"
