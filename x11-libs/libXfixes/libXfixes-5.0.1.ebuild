# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXfixes/libXfixes-5.0.1.ebuild,v 1.1 2013/06/01 03:17:40 chithanh Exp $

EAPI=4

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xfixes library"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11
	>=x11-proto/fixesproto-5
	x11-proto/xproto
	x11-proto/xextproto"
DEPEND="${RDEPEND}"
