# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DBI/DBI-1.628.0.ebuild,v 1.2 2014/01/20 23:09:50 vapier Exp $

EAPI=5

MODULE_AUTHOR=TIMB
MODULE_VERSION=1.628
inherit perl-module eutils

DESCRIPTION="The Perl DBI Module"

SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND="
	>=dev-perl/PlRPC-0.200.0
	>=virtual/perl-Sys-Syslog-0.170.0
	virtual/perl-File-Spec
	!<=dev-perl/SQL-Statement-1.330.0
"
#	!<=dev-perl/DBD-Amazon-0.100.0
#	!<=dev-perl/DBD-AnyData-0.110.0
#	!<=dev-perl/DBD-CSV-0.360.0
#	!<=dev-perl/DBD-Google-0.510.0
#	!<=dev-perl/DBD-PO-2.100.0
#	!<=dev-perl/DBD-RAM-0.72.0
DEPEND="${RDEPEND}
	test? (
		>=virtual/perl-Test-Simple-0.900.0
	)
"

SRC_TEST="do"
mydoc="ToDo"
MAKEOPTS="${MAKEOPTS} -j1"
