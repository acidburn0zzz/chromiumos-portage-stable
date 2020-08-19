# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN/xorg-/xorg}"
MY_P="${MY_PN}-${PV}"

EGIT_REPO_URI="https://gitlab.freedesktop.org/xorg/proto/${MY_PN}.git"

if [[ ${PV} = 9999* ]]; then
	GIT_ECLASS="git-r3"
fi

inherit ${GIT_ECLASS} meson

DESCRIPTION="X.Org combined protocol headers"
HOMEPAGE="https://gitlab.freedesktop.org/xorg/proto/xorgproto"
if [[ ${PV} = 9999* ]]; then
	SRC_URI=""
else
	KEYWORDS="*"
	SRC_URI="https://xorg.freedesktop.org/archive/individual/proto/${MY_P}.tar.gz"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""
