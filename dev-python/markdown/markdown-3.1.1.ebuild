# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Python implementation of the markdown markup language"
HOMEPAGE="
	https://python-markdown.github.io/
	https://pypi.org/project/Markdown/
	https://github.com/Python-Markdown/markdown"
SRC_URI="mirror://pypi/M/${PN^}/${P^}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="doc pygments test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/pytidylib[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)"
# source cites pytidylib however from testruns it appears optional
RDEPEND="pygments? ( dev-python/pygments[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${P^}"

python_compile_all() {
	if use doc; then
		esetup.py build_docs
		HTML_DOCS=( "${BUILD_DIR}"/docs/. )
	fi
}

python_test() {
	esetup.py test
}
