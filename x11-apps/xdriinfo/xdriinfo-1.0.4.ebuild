# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xdriinfo/xdriinfo-1.0.4.ebuild,v 1.8 2011/02/14 23:40:56 xarthisius Exp $

EAPI=3
inherit xorg-2

DESCRIPTION="query configuration information of DRI drivers"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11
	virtual/opengl"
DEPEND="${RDEPEND}
	x11-proto/glproto"

pkg_setup() {
	xorg-2_pkg_setup

	append-cppflags "-I${EPREFIX}/usr/lib64/opengl/xorg-x11/include/"

}
