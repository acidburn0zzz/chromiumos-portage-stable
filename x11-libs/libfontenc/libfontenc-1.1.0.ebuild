# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libfontenc/libfontenc-1.1.0.ebuild,v 1.10 2011/02/14 14:39:15 xarthisius Exp $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org fontenc library"

KEYWORDS="*"
IUSE=""

RDEPEND="sys-libs/zlib
	x11-proto/xproto"
DEPEND="${RDEPEND}"

CONFIGURE_OPTIONS="--with-encodingsdir=${EPREFIX}/usr/share/fonts/encodings"
