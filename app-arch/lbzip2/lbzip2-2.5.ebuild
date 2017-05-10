# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils

DESCRIPTION="Parallel bzip2 utility"
HOMEPAGE="https://github.com/kjn/lbzip2/"
SRC_URI="http://archive.lbzip2.org/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="debug symlink"

RDEPEND="symlink? ( !app-arch/pbzip2[symlink] )"
DEPEND=""

PATCHES=( "${FILESDIR}"/${PN}-2.3-s_isreg.patch )

src_configure() {
	local myeconfargs=(
		--disable-silent-rules
		$(use_enable debug tracing)
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install

	if use symlink; then
		dosym ${PN} /usr/bin/bzip2
		dosym lbunzip2 /usr/bin/bunzip2
	fi
}
