# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="GNU Autoconf Macro Archive"
HOMEPAGE="https://www.gnu.org/software/autoconf-archive/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

# File collisions. #540246
RDEPEND="!=gnome-base/gnome-common-3.14.0
	!>=gnome-base/gnome-common-3.14.0-r1[-autoconf-archive(+)]"
DEPEND=""

src_install() {
	default
	rm -r "${ED}/usr/share/${PN}" || die
}
