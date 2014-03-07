# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/jpeg/jpeg-62.ebuild,v 1.12 2014/02/21 19:25:28 ssuominen Exp $

EAPI=5

inherit multilib-build

DESCRIPTION="A virtual for the libjpeg.so.62 ABI for binary-only programs"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="62"
KEYWORDS="*"
IUSE=""

RDEPEND="|| (
		>=media-libs/libjpeg-turbo-1.3.0-r2:0[${MULTILIB_USEDEP}]
		media-libs/jpeg:62[${MULTILIB_USEDEP}]
		)"
DEPEND=""
