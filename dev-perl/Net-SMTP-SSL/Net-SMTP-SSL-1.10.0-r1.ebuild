# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Net-SMTP-SSL/Net-SMTP-SSL-1.10.0-r1.ebuild,v 1.1 2014/08/23 01:27:42 axs Exp $

EAPI=5

MODULE_AUTHOR=CWEST
MODULE_VERSION=1.01
inherit perl-module

DESCRIPTION="SSL support for Net::SMTP"

SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="virtual/perl-libnet
	dev-perl/IO-Socket-SSL"
DEPEND="${RDEPEND}"

SRC_TEST="do"
