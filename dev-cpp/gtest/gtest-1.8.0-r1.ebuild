# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

AUTOTOOLS_AUTORECONF=1
AUTOTOOLS_IN_SOURCE_BUILD=1
# Python is required for tests and some build tasks.
PYTHON_COMPAT=( python2_7 )

inherit eutils python-any-r1 autotools-multilib

DESCRIPTION="Google C++ Testing Framework"
HOMEPAGE="http://github.com/google/googletest/"
SRC_URI="https://github.com/google/googletest/archive/release-${PV}.tar.gz -> googletest-release-${PV}.tar.gz"
SRC_URI="https://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/googletest-release-${PV}.tar.gz"
S="${WORKDIR}/googletest-release-${PV}/googletest"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="examples"

DEPEND="${PYTHON_DEPS}"
RDEPEND=""

PATCHES=(
	"${FILESDIR}/configure-fix-pthread-linking.patch" #371647
	"${FILESDIR}/${P}-makefile-am.patch"
	"${FILESDIR}/${P}-threadlocal-api.patch"
)

src_prepare() {
	autotools-multilib_src_prepare
}

multilib_src_install() {
	default
	multilib_is_native_abi && dobin scripts/gtest-config
}

multilib_src_install_all() {
	prune_libtool_files --all
	einstalldocs

	if use examples ; then
		insinto /usr/share/doc/${PF}/examples
		doins samples/*.{cc,h}
	fi
}
