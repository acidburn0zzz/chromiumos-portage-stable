# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DIST_AUTHOR=GRANTM
DIST_VERSION=2.25
inherit perl-module

DESCRIPTION="An API for simple XML files"

SLOT="0"
KEYWORDS="*"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	virtual/perl-Storable
	>=dev-perl/XML-NamespaceSupport-1.40.0
	>=dev-perl/XML-SAX-0.150.0
	dev-perl/XML-SAX-Expat
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? ( >=virtual/perl-Test-Simple-0.880.0 )
"
PATCHES=("${FILESDIR}/${PN}-2.25-saxtests.patch")
PERL_RM_FILES=("t/author-pod-syntax.t")
