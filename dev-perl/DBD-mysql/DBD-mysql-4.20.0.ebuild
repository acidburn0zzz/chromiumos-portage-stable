# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DBD-mysql/DBD-mysql-4.20.0.ebuild,v 1.11 2013/09/05 05:49:04 vapier Exp $

EAPI=4

MODULE_AUTHOR=CAPTTOFU
MODULE_VERSION=4.020
inherit eutils perl-module

DESCRIPTION="The Perl DBD:mysql Module"

SLOT="0"
KEYWORDS="*"
IUSE="embedded"

RDEPEND="dev-perl/DBI
	virtual/mysql[embedded?]"
DEPEND="${RDEPEND}"

mydoc="ToDo"

src_configure() {
	use embedded && myconf="${myconf} --force-embedded --embedded=mysql_config"
	perl-module_src_configure
}
