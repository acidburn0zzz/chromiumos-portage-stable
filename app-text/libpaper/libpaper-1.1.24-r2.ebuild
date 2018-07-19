# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils autotools multilib-minimal

MY_PV=${PV/_p/+nmu}
DESCRIPTION="Library for handling paper characteristics"
HOMEPAGE="http://packages.debian.org/unstable/source/libpaper"
SRC_URI="mirror://debian/pool/main/libp/libpaper/${PN}_${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

S="${WORKDIR}/${PN}-${MY_PV}"

DOCS=( README ChangeLog debian/changelog )

src_prepare() {
	sed -e "s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/" -i configure.ac || die
	eautoreconf
}

multilib_src_configure() {
	ECONF_SOURCE="${S}"	econf \
		--disable-static
}

multilib_src_install_all() {
	prune_libtool_files --all
	einstalldocs

	dodir /etc
	(paperconf 2>/dev/null || echo a4) > "${ED}"/etc/papersize \
		|| die "papersize config failed"

	if ! has_version app-text/libpaper ; then
		echo
		elog "run e.g. \"paperconfig -p letter\" as root to use letter-pagesizes"
		echo
	fi
}
