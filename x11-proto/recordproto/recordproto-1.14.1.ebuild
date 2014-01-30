# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-proto/recordproto/recordproto-1.14.1.ebuild,v 1.8 2011/02/14 14:21:28 xarthisius Exp $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org Record protocol headers"

KEYWORDS="*"
IUSE="doc"

RDEPEND="!<x11-libs/libXtst-1.0.99.2"
DEPEND="${RDEPEND}
	doc? ( app-text/xmlto )"

pkg_setup() {
	xorg-2_pkg_setup

	CONFIGURE_OPTIONS="$(use_enable doc specs)
		$(use_with doc xmlto)
		--without-fop"
}
