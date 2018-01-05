# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

if [[ ${PV} == "99999999" ]] ; then
	inherit autotools git-r3
	EGIT_REPO_URI="git://anongit.gentoo.org/proj/${PN}.git"
else
	SRC_URI="mirror://gentoo/${P}.tar.bz2
		https://dev.gentoo.org/~floppym/dist/${P}.tar.bz2"
	KEYWORDS="*"
fi

DESCRIPTION="Eselect module for management of multiple Python versions"
HOMEPAGE="https://www.gentoo.org/proj/en/Python/"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=app-admin/eselect-1.2.3"

src_prepare() {
	epatch "${FILESDIR}"/${P}-pythonX.Y-config.patch
	[[ ${PV} == "99999999" ]] && eautoreconf
}

src_install() {
	keepdir /etc/env.d/python
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	if has_version 'dev-lang/python'; then
		eselect python update --if-unset
	fi
	if has_version '=dev-lang/python-2*'; then
		eselect python update --python2 --if-unset
	fi
	if has_version '=dev-lang/python-3*'; then
		eselect python update --python3 --if-unset
	fi
}
