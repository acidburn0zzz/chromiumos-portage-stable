# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils flag-o-matic

DESCRIPTION="Stressful Application Test"
HOMEPAGE="https://github.com/stressapptest/stressapptest"
SRC_URI="https://github.com/stressapptest/stressapptest/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"
IUSE="debug"

RDEPEND="dev-libs/libaio"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply "${FILESDIR}"/${PN}-gnu_cxx-namespace.patch
	eapply_user
}

src_configure() {
	# Matches the configure & sat.cc logic.
	use debug || append-cppflags -DNDEBUG -DCHECKOPTS
	econf --disable-default-optimizations
}
