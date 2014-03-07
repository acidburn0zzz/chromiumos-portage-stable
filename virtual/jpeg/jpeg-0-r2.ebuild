# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/jpeg/jpeg-0-r2.ebuild,v 1.13 2014/02/20 14:16:44 ago Exp $

EAPI=5

inherit multilib-build

DESCRIPTION="A virtual for selecting between libjpeg-turbo and IJG jpeg for source-based packages"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

RDEPEND="|| (
		>=media-libs/libjpeg-turbo-1.3.0-r2:0[static-libs?,${MULTILIB_USEDEP}]
		>=media-libs/jpeg-8d-r1:0[static-libs?,${MULTILIB_USEDEP}]
		)"
DEPEND=""
