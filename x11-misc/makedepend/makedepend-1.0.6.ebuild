# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
XORG_STATIC=no
inherit xorg-3

DESCRIPTION="create dependencies in makefiles"
KEYWORDS="*"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	x11-base/xorg-proto"
