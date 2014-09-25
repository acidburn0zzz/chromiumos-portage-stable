# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/libffi/libffi-3.0.13-r1.ebuild,v 1.14 2014/07/06 16:56:06 grobian Exp $

# The purpose of this ebuild is to provide quick fallback if and when we need to
# switch back to internal copy of libffi from sys-devel/gcc.

EAPI=5

inherit multilib-build

DESCRIPTION="A virtual for the Foreign Function Interface implementation"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=">=dev-libs/libffi-3.0.13-r1[${MULTILIB_USEDEP}]"
DEPEND=""
