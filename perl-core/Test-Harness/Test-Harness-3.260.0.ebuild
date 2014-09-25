# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Test-Harness/Test-Harness-3.260.0.ebuild,v 1.14 2014/01/20 20:46:24 vapier Exp $

EAPI=5

MODULE_AUTHOR=OVID
MODULE_VERSION=3.26
inherit perl-module

DESCRIPTION="Runs perl standard test scripts with statistics"

SLOT="0"
KEYWORDS="*"
IUSE=""

PREFER_BUILDPL=no
SRC_TEST="do"
mydoc="rfc*.txt"
