# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/libusb/libusb-1.ebuild,v 1.24 2013/05/12 15:38:19 dilfridge Exp $

EAPI=2

DESCRIPTION="Virtual for libusb"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="1"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="|| ( >=dev-libs/libusbx-1.0.15:1 >=dev-libs/libusb-1.0.9:1 >=sys-freebsd/freebsd-lib-9.1_rc3-r1[usb] )"
