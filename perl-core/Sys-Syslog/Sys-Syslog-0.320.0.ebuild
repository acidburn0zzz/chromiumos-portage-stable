# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Sys-Syslog/Sys-Syslog-0.320.0.ebuild,v 1.13 2014/01/20 23:09:41 vapier Exp $

EAPI=4

MODULE_AUTHOR=SAPER
MODULE_VERSION=0.32
inherit perl-module

DESCRIPTION="Provides same functionality as BSD syslog"

SLOT="0"
KEYWORDS="*"
IUSE=""

# Tests disabled - they attempt to verify on the live system
#SRC_TEST="do"
