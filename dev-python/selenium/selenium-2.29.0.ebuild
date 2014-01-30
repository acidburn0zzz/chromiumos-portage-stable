# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/selenium/selenium-2.29.0.ebuild,v 1.3 2013/09/05 18:46:06 mgorny Exp $

EAPI=4
PYTHON_DEPEND="2:2.6"

inherit distutils

DESCRIPTION="a Python language binding for Selenium Remote Control (version 1.0 and 2.0)"
HOMEPAGE="http://pypi.python.org/pypi/selenium/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="*"
IUSE="doc"
LICENSE="Apache-2.0"
SLOT="0"
DOCS=( py/CHANGES py/README )

DISTUTILS_IN_SOURCE_BUILD=1
src_install() {
	distutils_src_install
	dodoc ${DOCS[@]}
}
