# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/pkgconfig/pkgconfig-0.ebuild,v 1.3 2012/05/04 13:05:26 ssuominen Exp $

EAPI="2"

DESCRIPTION="virtual for pkg-config"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="|| (
		dev-util/pkgconfig
		dev-util/pkg-config-lite
		dev-util/pkgconf[pkg-config]
		dev-util/pkgconfig-openbsd[pkg-config]
	)"
RDEPEND="${DEPEND}"
