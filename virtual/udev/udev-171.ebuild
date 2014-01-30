# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/udev/Attic/udev-171.ebuild,v 1.7 2013/04/24 19:38:07 ssuominen dead $

EAPI=2

DESCRIPTION="Virtual for udev implementation and number of its features"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
# USE flags kmod and static-libs are here dummy in purpose
IUSE="gudev hwdb introspection keymap +kmod selinux static-libs"

DEPEND=""
RDEPEND="~sys-fs/udev-171[gudev?,hwdb?,introspection?,keymap?,selinux?]"
