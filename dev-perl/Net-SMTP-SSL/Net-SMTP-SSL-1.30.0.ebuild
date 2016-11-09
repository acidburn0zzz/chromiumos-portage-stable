# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MODULE_AUTHOR=RJBS
MODULE_VERSION=1.03
inherit perl-module

DESCRIPTION="SSL support for Net::SMTP"

SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND="
	virtual/perl-libnet
	dev-perl/IO-Socket-SSL
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? ( virtual/perl-Test-Simple )
"

SRC_TEST="do parallel"
