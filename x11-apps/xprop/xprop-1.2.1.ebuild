# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xprop/xprop-1.2.1.ebuild,v 1.9 2011/10/03 17:57:35 josejx Exp $

EAPI=4
inherit xorg-2

DESCRIPTION="property displayer for X"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11"
DEPEND="${RDEPEND}
	>=x11-proto/xproto-7.0.17
"
