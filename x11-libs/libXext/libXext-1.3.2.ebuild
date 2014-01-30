# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXext/libXext-1.3.2.ebuild,v 1.1 2013/06/01 12:08:13 chithanh Exp $

EAPI=4

XORG_DOC=doc
XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xext library"

KEYWORDS="*"
IUSE=""

RDEPEND=">=x11-libs/libX11-1.2
	>=x11-proto/xextproto-7.1.99"
DEPEND="${RDEPEND}"

src_configure() {
	XORG_CONFIGURE_OPTIONS=(
		$(use_enable doc specs)
		$(use_with doc xmlto)
		--without-fop
	)
	xorg-2_src_configure
}
