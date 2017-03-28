# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

AUTOTOOLS_AUTORECONF=1
AUTOTOOLS_IN_SOURCE_BUILD=1
# Python is required for tests and some build tasks.
PYTHON_COMPAT=( python2_7 )

inherit eutils python-any-r1 autotools-multilib

DESCRIPTION="Google C++ Mocking Framework"
HOMEPAGE="http://github.com/google/googletest/"
SRC_URI="https://github.com/google/googletest/archive/release-${PV}.tar.gz -> googletest-release-${PV}.tar.gz"
SRC_URI="https://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/googletest-release-${PV}.tar.gz"
S="${WORKDIR}/googletest-release-${PV}/googlemock"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND="=dev-cpp/gtest-${PV}*[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( ${PYTHON_DEPS} )"

PATCHES=(
	"${FILESDIR}/${P}-makefile-am.patch"
)

src_prepare() {
	autotools-multilib_src_prepare
}

multilib_src_install() {
	default
	multilib_is_native_abi && dobin scripts/gmock-config
}

multilib_src_install_all() {
	prune_libtool_files --all
	einstalldocs
}
