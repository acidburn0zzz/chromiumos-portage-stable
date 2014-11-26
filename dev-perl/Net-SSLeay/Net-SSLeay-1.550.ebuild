# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Net-SSLeay/Net-SSLeay-1.550.ebuild,v 1.12 2014/06/06 05:42:45 vapier Exp $

EAPI=5

MODULE_AUTHOR=MIKEM
MODULE_VERSION=1.55
inherit multilib perl-module

DESCRIPTION="Net::SSLeay module for perl"

LICENSE="SSLeay"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="dev-libs/openssl"
DEPEND="${RDEPEND}"
#	test? ( dev-perl/Test-Exception
#		dev-perl/Test-Warn
#		dev-perl/Test-NoWarnings )"

#SRC_TEST=do

export OPTIMIZE="$CFLAGS"
export OPENSSL_PREFIX=${EPREFIX}/usr

src_prepare() {
	sed -i \
		-e "/\$opts->{optimize} = '-O2 -g';/d" \
		-e "s,\"\$prefix/lib\",\"\$prefix/$(get_libdir)\"," \
		inc/Module/Install/PRIVATE/Net/SSLeay.pm || die
	perl-module_src_prepare
}
