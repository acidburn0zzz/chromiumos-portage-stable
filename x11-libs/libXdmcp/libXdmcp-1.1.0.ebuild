# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXdmcp/libXdmcp-1.1.0.ebuild,v 1.9 2011/02/14 14:38:15 xarthisius Exp $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org Xdmcp library"

KEYWORDS="*"
IUSE="doc"

RDEPEND="x11-proto/xproto"
DEPEND="${RDEPEND}
	doc? ( app-text/xmlto )"

pkg_setup() {
	xorg-2_pkg_setup

	CONFIGURE_OPTIONS="$(use_enable doc docs)
		$(use_with doc xmlto)
		--without-fop"
}
