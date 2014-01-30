# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Digest-SHA1/Digest-SHA1-2.12.ebuild,v 1.9 2011/07/30 10:29:03 tove Exp $

EAPI=2

MODULE_AUTHOR=GAAS
inherit perl-module

DESCRIPTION="NIST SHA message digest algorithm"

SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="virtual/perl-digest-base"
RDEPEND="${DEPEND}"

SRC_TEST="do"
