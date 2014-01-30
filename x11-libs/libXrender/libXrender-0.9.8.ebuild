# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXrender/libXrender-0.9.8.ebuild,v 1.1 2013/06/18 14:17:08 chithanh Exp $

EAPI=4

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xrender library"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11
	>=x11-proto/renderproto-0.9.3
	x11-proto/xproto"
DEPEND="${RDEPEND}"
