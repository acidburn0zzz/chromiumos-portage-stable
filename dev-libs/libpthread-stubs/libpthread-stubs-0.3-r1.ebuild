# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="Pthread functions stubs for platforms missing them"
SRC_URI="https://xcb.freedesktop.org/dist/${P}.tar.bz2"

KEYWORDS="*"
IUSE=""

RDEPEND=""
DEPEND=""
