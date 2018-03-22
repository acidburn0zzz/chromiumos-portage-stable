# Copyright 2018 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2.

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} pypy )

inherit distutils-r1

DESCRIPTION="HTTP library with thread-safe connection pooling, file post"
HOMEPAGE="https://pypi.python.org/pypi/urllib3 https://urllib3.readthedocs.io/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"

RDEPEND=""
DEPEND="${RDEPEND}
		dev-python/setuptools"
