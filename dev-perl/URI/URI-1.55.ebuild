# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/URI/URI-1.55.ebuild,v 1.9 2011/07/30 10:45:59 tove Exp $

EAPI=2

MODULE_AUTHOR=GAAS
inherit perl-module

DESCRIPTION="A URI Perl Module"

SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="virtual/perl-MIME-Base64"
RDEPEND="${DEPEND}"

SRC_TEST=no # see ChangeLog

mydoc="rfc2396.txt"
