# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-proto/xf86dgaproto/xf86dgaproto-2.1.ebuild,v 1.10 2010/08/02 18:14:35 armin76 Exp $

inherit x-modular

DESCRIPTION="X.Org XF86DGA protocol headers"

KEYWORDS="*"
IUSE=""

RDEPEND="!<x11-libs/libXxf86dga-1.0.99.1"
DEPEND="${RDEPEND}"
