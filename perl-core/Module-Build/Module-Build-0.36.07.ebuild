# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Module-Build/Module-Build-0.36.07.ebuild,v 1.8 2011/07/30 12:20:40 tove Exp $

EAPI=2

inherit versionator
MODULE_AUTHOR=DAGOLDEN
MY_P=${PN}-$(delete_version_separator 2)
S=${WORKDIR}/${MY_P}
inherit perl-module

DESCRIPTION="Build and install Perl modules"

SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND="dev-perl/YAML-Tiny
	>=virtual/perl-ExtUtils-CBuilder-0.27
	>=virtual/perl-ExtUtils-ParseXS-2.22.05
	>=virtual/perl-Archive-Tar-1.09
	>=virtual/perl-Test-Harness-3.16"
RDEPEND="${DEPEND}"

SRC_TEST="do"
