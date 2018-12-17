# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Virtual for the device filesystem manager"
SLOT="0"
KEYWORDS="*"

RDEPEND="|| (
		virtual/udev
		sys-apps/busybox[mdev]
		sys-fs/devfsd
		sys-fs/static-dev
		sys-freebsd/freebsd-sbin
	)"
