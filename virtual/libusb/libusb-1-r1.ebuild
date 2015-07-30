# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/libusb/libusb-1-r1.ebuild,v 1.18 2014/06/18 20:57:13 mgorny Exp $

EAPI=5
inherit multilib-build

DESCRIPTION="Virtual for libusb"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="1"
KEYWORDS="*"
IUSE="udev"

RDEPEND="|| ( >=dev-libs/libusb-1.0.9-r2:1[udev(+)?,${MULTILIB_USEDEP}] >=sys-freebsd/freebsd-lib-9.1-r10[usb,${MULTILIB_USEDEP}] )"
DEPEND=""
