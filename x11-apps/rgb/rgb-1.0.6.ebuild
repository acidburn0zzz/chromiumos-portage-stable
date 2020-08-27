# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit xorg-2

DESCRIPTION="uncompile an rgb color-name database"

KEYWORDS="*"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}
	x11-base/xorg-proto
	x11-misc/util-macros"
