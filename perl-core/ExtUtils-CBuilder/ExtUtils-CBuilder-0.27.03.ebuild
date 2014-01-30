# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/ExtUtils-CBuilder/ExtUtils-CBuilder-0.27.03.ebuild,v 1.7 2011/07/30 12:13:40 tove Exp $

EAPI=2

inherit versionator
MY_P=${PN}-$(delete_version_separator 2 )
MODULE_AUTHOR=DAGOLDEN
S=${WORKDIR}/${MY_P}
inherit perl-module

DESCRIPTION="Compile and link C code for Perl modules"

SLOT="0"
KEYWORDS="*"
IUSE=""

SRC_TEST="do"
