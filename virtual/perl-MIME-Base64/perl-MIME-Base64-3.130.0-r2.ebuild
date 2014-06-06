# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/perl-MIME-Base64/perl-MIME-Base64-3.130.0-r2.ebuild,v 1.15 2014/01/20 20:33:55 vapier Exp $

DESCRIPTION="Virtual for ${PN#perl-}"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="|| ( =dev-lang/perl-5.16* =dev-lang/perl-5.14* ~perl-core/${PN#perl-}-${PV}  )"
