# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit xorg-2

DESCRIPTION="create an index of scalable font files for X"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libfontenc
	media-libs/freetype:2"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	app-arch/gzip
	app-arch/bzip2"

XORG_CONFIGURE_OPTIONS=(
	--with-bzip2
)
