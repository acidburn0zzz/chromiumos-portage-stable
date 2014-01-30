# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/setuptools/setuptools-0.8-r1.ebuild,v 1.11 2013/09/06 18:33:47 ago Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy2_0 )

inherit distutils-r1

DESCRIPTION="a collection of extensions to Distutils"
HOMEPAGE="http://pypi.python.org/pypi/setuptools"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

# Force in-source build because build system modifies sources.
DISTUTILS_IN_SOURCE_BUILD=1

DOCS=( README.txt docs/{easy_install.txt,pkg_resources.txt,setuptools.txt} )

python_prepare_all() {
	local PATCHES=(
		"${FILESDIR}"/${PN}-0.9.8-install_scripts-overwrite.patch
	)

	# Disable tests requiring network connection.
	rm -f setuptools/tests/test_packageindex.py

	distutils-r1_python_prepare_all
}

python_test() {
	# Fails test_setup_requires under python2.5; probably a distutils bug
	esetup.py test
}

python_install() {
	export DISTRIBUTE_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=1
	distutils-r1_python_install
}
