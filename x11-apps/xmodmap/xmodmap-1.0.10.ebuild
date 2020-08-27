# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xorg-3

DESCRIPTION="utility for modifying keymaps and pointer button mappings in X"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}"
