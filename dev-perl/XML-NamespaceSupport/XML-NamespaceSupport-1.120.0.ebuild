# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR=PERIGRIN
DIST_VERSION=1.12
inherit perl-module

DESCRIPTION="A Perl module that offers a simple to process namespaced XML names"

SLOT="0"
KEYWORDS="*"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	>=virtual/perl-ExtUtils-MakeMaker-6.170.0
	test? ( virtual/perl-Test-Simple )
"
