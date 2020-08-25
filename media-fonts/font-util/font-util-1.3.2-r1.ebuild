# Copyright 2005-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit xorg-3

EGIT_REPO_URI="https://anongit.freedesktop.org/git/xorg/font/util.git"
DESCRIPTION="X.Org font utilities"
HOMEPAGE="https://www.x.org/wiki/ https://gitlab.freedesktop.org/xorg/font/util"

KEYWORDS="*"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

XORG_CONFIGURE_OPTIONS=(
	--with-fontrootdir="${EPREFIX}/usr/share/fonts"
	--with-mapdir="${EPREFIX}/usr/share/fonts/util"
)
