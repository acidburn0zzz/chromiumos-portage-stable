# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/jpeg/jpeg-0.ebuild,v 1.5 2011/04/27 18:03:05 grobian Exp $

EAPI=2

DESCRIPTION="Virtual for jpeg library"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

RDEPEND="|| ( media-libs/libjpeg-turbo:0[static-libs?] media-libs/jpeg:0[static-libs?] )"
DEPEND=""
