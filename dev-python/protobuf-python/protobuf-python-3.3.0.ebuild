# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
# pypy fails tests; pypy3 fails even running tests
PYTHON_COMPAT=( python2_7 python3_{4,5} )

inherit distutils-r1

MY_PV=${PV/_beta/-beta-}
MY_PV=${MY_PV/_p/.}

DESCRIPTION="Google's Protocol Buffers - official Python bindings"
HOMEPAGE="https://github.com/google/protobuf/ https://developers.google.com/protocol-buffers/"
SRC_URI="https://github.com/google/protobuf/archive/v${MY_PV}.tar.gz -> protobuf-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0/13"
KEYWORDS="*"
IUSE=""

# Protobuf is only a build-time dep, but depends on the exact same version
# (excluding revision), since we are using the same tarball.
# In case of using the (linked) cpp implementation we should be fine with the same subslot.
RDEPEND="${PYTHON_DEPS}
	!<dev-libs/protobuf-3[python(-)]
	!dev-libs/protobuf-python
	~dev-libs/protobuf-${PV}"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"

PATCHES=( "${FILESDIR}/${PN}-3.0.0_beta3-link-against-installed-lib.patch" )

S="${WORKDIR}/protobuf-${MY_PV}/python"

src_prepare() {
	epatch "${PATCHES[@]}"
}

python_test() {
	esetup.py test
}
