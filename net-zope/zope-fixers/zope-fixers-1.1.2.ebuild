# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-zope/zope-fixers/zope-fixers-1.1.2.ebuild,v 1.8 2014/06/23 12:36:36 klausman Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} pypy pypy2_0 )

inherit distutils-r1

MY_PN="${PN/-/.}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="2to3 fixers for Zope"
HOMEPAGE="http://pypi.python.org/pypi/zope.fixers"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.zip"

LICENSE="ZPL"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="app-arch/unzip
	dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""

S="${WORKDIR}/${MY_P}"

DOCS=( CHANGES.txt README.txt )

PATCHES=( "${FILESDIR}"/${P}-tests.patch )

python_test() {
	esetup.py test
}
