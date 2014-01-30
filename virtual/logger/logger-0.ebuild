# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/logger/logger-0.ebuild,v 1.3 2012/08/21 12:50:50 sbriesen Exp $

DESCRIPTION="Virtual for system loggers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="|| ( app-admin/metalog
	app-admin/rsyslog
	app-admin/socklog
	app-admin/sysklogd
	app-admin/syslog-ng
	app-admin/syslogread
	app-admin/busybox-sysklogd
	sys-freebsd/freebsd-usbin
)"
