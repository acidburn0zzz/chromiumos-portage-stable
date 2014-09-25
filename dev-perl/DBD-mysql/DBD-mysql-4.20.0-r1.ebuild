# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DBD-mysql/DBD-mysql-4.20.0-r1.ebuild,v 1.1 2014/08/20 20:27:28 axs Exp $

EAPI=5

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
