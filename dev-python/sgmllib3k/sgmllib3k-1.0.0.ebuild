# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..8} pypy3 )
inherit distutils-r1

DESCRIPTION="Py3k port of sgmllib"
HOMEPAGE="https://pypi.org/project/sgmllib3k/"
SRC_URI="mirror://pypi/${PN::1}/${PN}/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="*"
