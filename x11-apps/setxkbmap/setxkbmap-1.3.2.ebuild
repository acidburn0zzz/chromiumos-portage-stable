# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xorg-3

DESCRIPTION="Controls the keyboard layout of a running X server"

KEYWORDS="*"
IUSE=""
COMMON_DEPEND="
	x11-libs/libxkbfile
	x11-libs/libX11"
DEPEND="${COMMON_DEPEND}
	x11-base/xorg-proto"
RDEPEND="${COMMON_DEPEND}
	x11-misc/xkeyboard-config"
