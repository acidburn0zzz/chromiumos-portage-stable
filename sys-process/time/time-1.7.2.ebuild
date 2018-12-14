# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="Displays info about resources used by a program"
HOMEPAGE="https://www.gnu.org/directory/time.html"
SRC_URI="http://git.savannah.gnu.org/cgit/time.git/snapshot/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="sys-apps/texinfo"

PATCHES=(
	"${FILESDIR}"/${PN}-1.7-build.patch
	"${FILESDIR}"/1.7-info-dir-entry.patch
	"${FILESDIR}"/${PN}-1.7.2-incorrect_memory_usage.patch
)

src_prepare() {
	default
	eautoreconf
}
