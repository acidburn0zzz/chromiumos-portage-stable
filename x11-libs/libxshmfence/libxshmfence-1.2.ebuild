# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="Shared memory fences using futexes"

KEYWORDS="*"
IUSE=""

RDEPEND=""
DEPEND=">=x11-proto/xproto-7.0.24:=[${MULTILIB_USEDEP}]
	${RDEPEND}"
