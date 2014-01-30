# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXv/libXv-1.0.9.ebuild,v 1.1 2013/06/23 04:52:22 mattst88 Exp $

EAPI=4

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xv library"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-proto/videoproto
	x11-proto/xproto"
DEPEND="${RDEPEND}"
