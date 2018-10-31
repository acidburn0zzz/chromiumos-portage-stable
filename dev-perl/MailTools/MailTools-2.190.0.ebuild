# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MODULE_AUTHOR=MARKOV
MODULE_VERSION=2.19
MODULE_EXAMPLES=("examples/*")
inherit perl-module

DESCRIPTION="Manipulation of electronic mail addresses"

SLOT="0"
KEYWORDS="*"
IUSE="test"

RDEPEND="
	dev-perl/TimeDate
	virtual/perl-IO
	>=virtual/perl-libnet-1.50.0
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? ( virtual/perl-Test-Simple )
"
