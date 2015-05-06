# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-eselect/eselect-vi/eselect-vi-1.1.9.ebuild,v 1.1 2015/03/31 16:58:01 ulm Exp $

EAPI=5

DESCRIPTION="Manages the /usr/bin/vi symlink"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI="http://dev.gentoo.org/~yngwin/distfiles/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND=">=app-admin/eselect-1.0.6
	!app-admin/eselect-vi"

src_install() {
	insinto /usr/share/eselect/modules
	doins vi.eselect || die
}
