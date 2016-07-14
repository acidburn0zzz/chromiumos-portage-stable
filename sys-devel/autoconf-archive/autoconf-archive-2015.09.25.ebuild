# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="GNU Autoconf Macro Archive"
HOMEPAGE="https://www.gnu.org/software/autoconf-archive/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

#file collisions, bug #540246
RDEPEND="!=gnome-base/gnome-common-3.14.0
	!>=gnome-base/gnome-common-3.14.0-r1[-autoconf-archive(+)]"
DEPEND=""

DOCS=( AUTHORS ChangeLog NEWS README TODO )

src_install() {
	default
	rm -r "${ED}/usr/share/${PN}" || die
}
