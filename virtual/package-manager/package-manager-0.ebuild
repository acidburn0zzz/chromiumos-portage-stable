# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/package-manager/package-manager-0.ebuild,v 1.5 2014/03/26 08:58:21 ulm Exp $

EAPI=5

DESCRIPTION="Virtual for the package manager"
SLOT="0"
KEYWORDS="*"

RDEPEND="|| ( sys-apps/portage
		sys-apps/paludis
		sys-apps/pkgcore )"
