# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/IO-Zlib/IO-Zlib-1.100.0.ebuild,v 1.2 2011/07/30 12:19:04 tove Exp $

EAPI=2

MODULE_AUTHOR=TOMHUGHES
MODULE_VERSION=1.10
inherit perl-module

DESCRIPTION="IO:: style interface to Compress::Zlib"

SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="virtual/perl-IO-Compress"
DEPEND="${RDEPEND}"

SRC_TEST="do"
