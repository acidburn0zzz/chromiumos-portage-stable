# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Module-Build/Module-Build-0.400.300-r1.ebuild,v 1.1 2014/07/26 14:07:02 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=LEONT
MODULE_VERSION=0.4003
inherit perl-module

DESCRIPTION="Build and install Perl modules"

SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND="
	>=virtual/perl-CPAN-Meta-2.110.420
	>=virtual/perl-CPAN-Meta-YAML-0.3.0
	>=virtual/perl-Parse-CPAN-Meta-1.440.100
	>=virtual/perl-Module-Metadata-1.0.2
	>=virtual/perl-Perl-OSType-1
	>=virtual/perl-ExtUtils-CBuilder-0.27
	>=virtual/perl-ExtUtils-ParseXS-2.22.05
	>=virtual/perl-Archive-Tar-1.09
	>=virtual/perl-Test-Harness-3.16
	>=virtual/perl-version-0.87
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
