# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/logger/logger-0.ebuild,v 1.7 2013/07/26 03:59:21 williamh Exp $

EAPI=3

DESCRIPTION="Virtual for system loggers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="|| (
	app-admin/metalog
	app-admin/rsyslog
	app-admin/socklog
	app-admin/sysklogd
	app-admin/syslog-ng
	app-admin/syslogread
	sys-freebsd/freebsd-usbin
	sys-apps/busybox[syslog]
	>=sys-apps/systemd-38
)"
