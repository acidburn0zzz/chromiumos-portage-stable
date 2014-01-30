# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/os-headers/os-headers-0.ebuild,v 1.4 2011/05/09 20:11:43 ulm Exp $

EAPI=1

DESCRIPTION="Virtual for operating system headers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
# depend on SLOT 0 of linux-headers, because kernel-2.eclass
# sets a different SLOT for cross-building
RDEPEND="!prefix? (
		|| ( sys-kernel/linux-headers:0
			sys-freebsd/freebsd-lib )
	)"
