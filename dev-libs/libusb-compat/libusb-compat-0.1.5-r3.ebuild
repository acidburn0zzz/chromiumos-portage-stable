# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libusb-compat/libusb-compat-0.1.5-r3.ebuild,v 1.1 2014/05/21 12:25:53 mgorny Exp $

EAPI=5
inherit eutils toolchain-funcs multilib-minimal

DESCRIPTION="Userspace access to USB devices (libusb-0.1 compat wrapper)"
HOMEPAGE="http://libusb.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN/-compat}/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="debug examples static-libs"

RDEPEND="virtual/libusb:1[${MULTILIB_USEDEP}]
	!dev-libs/libusb:0
	abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20130224-r7
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)]
	)"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="AUTHORS ChangeLog NEWS README"

src_prepare() {
	epatch "${FILESDIR}"/${PN/-compat}-0.1-ansi.patch
}

MULTILIB_CHOST_TOOLS=(
	/usr/bin/libusb-config
)

multilib_src_configure() {
	ECONF_SOURCE=${S} \
	econf \
		$(use_enable static-libs static) \
		$(use_enable debug debug-log)
}

multilib_src_install() {
	emake DESTDIR="${D}" install

	multilib_is_native_abi && gen_usr_ldscript -a usb
}

multilib_src_install_all() {
	prune_libtool_files
	einstalldocs

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins examples/*.c
	fi
}
