# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/IO-Socket-SSL/IO-Socket-SSL-1.953.0.ebuild,v 1.12 2014/06/06 05:42:28 vapier Exp $

EAPI=5

MODULE_AUTHOR=SULLR
MODULE_VERSION=1.953
inherit perl-module

DESCRIPTION="Nearly transparent SSL encapsulation for IO::Socket::INET"

SLOT="0"
KEYWORDS="*"
IUSE="idn"

DEPEND="
	>=dev-perl/Net-SSLeay-1.330.0
	virtual/perl-Scalar-List-Utils
	idn? (
		|| (
			>=dev-perl/URI-1.50
			dev-perl/Net-LibIDN
		)
	)"
RDEPEND="${DEPEND}"

SRC_TEST="do"
