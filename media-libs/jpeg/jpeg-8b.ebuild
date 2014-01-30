# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/jpeg/jpeg-8b.ebuild,v 1.10 2011/01/06 00:03:56 ssuominen Exp $

EAPI="3"

DEB_PV="7-1"
DEB_PN="libjpeg7"
DEB="${DEB_PN}_${DEB_PV}"

inherit eutils libtool multilib

DESCRIPTION="Library to load, handle and manipulate images in the JPEG format"
HOMEPAGE="http://jpegclub.org/ http://www.ijg.org/"
SRC_URI="http://www.ijg.org/files/${PN}src.v${PV}.tar.gz
	mirror://debian/pool/main/libj/${DEB_PN}/${DEB}.diff.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${WORKDIR}"/${DEB}.diff
	cp "${FILESDIR}"/Makefile.in.extra debian/extra/Makefile.in
}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-7-maxmem_sysconf.patch
	elibtoolize
	# hook the Debian extra dir into the normal jpeg build env
	sed -i '/all:/s:$:\n\t./config.status --file debian/extra/Makefile\n\t$(MAKE) -C debian/extra $@:' Makefile.in
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		--enable-shared \
		$(use_enable static-libs static) \
		--enable-maxmem=64
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc change.log example.c README *.txt

	find "${ED}" -name '*.la' -exec rm -f '{}' +
}
