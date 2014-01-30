# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Archive-Tar/Archive-Tar-1.54.ebuild,v 1.11 2011/07/30 12:09:43 tove Exp $

EAPI=2

MODULE_AUTHOR=BINGOS
inherit perl-module

DESCRIPTION="A Perl module for creation and manipulation of tar files"

SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=">=virtual/perl-IO-Zlib-1.01
	virtual/perl-IO-Compress
	virtual/perl-Package-Constants"
#	dev-perl/IO-String
RDEPEND="${DEPEND}"

SRC_TEST="do"
