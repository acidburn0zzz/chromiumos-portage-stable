# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Digest-SHA1/Digest-SHA1-2.130.0-r1.ebuild,v 1.1 2014/08/20 17:30:47 axs Exp $

EAPI=5

MODULE_AUTHOR=GAAS
MODULE_VERSION=2.13
inherit perl-module

DESCRIPTION="NIST SHA message digest algorithm"

SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="virtual/perl-Digest"
RDEPEND="${DEPEND}"

SRC_TEST="do"
