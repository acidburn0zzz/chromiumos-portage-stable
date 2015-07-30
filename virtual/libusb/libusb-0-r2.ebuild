# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/libusb/libusb-0-r2.ebuild,v 1.1 2014/06/18 13:52:43 axs Exp $

EAPI=5
inherit multilib-build

DESCRIPTION="Virtual for libusb"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="|| ( >=dev-libs/libusb-compat-0.1.5-r2[${MULTILIB_USEDEP}] >=sys-freebsd/freebsd-lib-9.1-r11[usb,${MULTILIB_USEDEP}] )"
DEPEND=""
