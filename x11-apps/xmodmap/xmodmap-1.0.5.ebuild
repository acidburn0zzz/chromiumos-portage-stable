# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xmodmap/xmodmap-1.0.5.ebuild,v 1.9 2011/02/14 18:53:51 xarthisius Exp $

EAPI=3

inherit xorg-2

DESCRIPTION="utility for modifying keymaps and pointer button mappings in X"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}"
