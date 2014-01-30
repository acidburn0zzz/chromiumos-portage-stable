# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-proto/xineramaproto/xineramaproto-1.2.1.ebuild,v 1.7 2011/03/05 17:51:07 xarthisius Exp $

EAPI=3

inherit xorg-2

DESCRIPTION="X.Org Xinerama protocol headers"

KEYWORDS="*"
IUSE=""

RDEPEND="!<x11-libs/libXinerama-1.0.99.1"
DEPEND="${RDEPEND}"
