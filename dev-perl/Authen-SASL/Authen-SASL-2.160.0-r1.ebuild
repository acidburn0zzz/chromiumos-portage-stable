# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Authen-SASL/Authen-SASL-2.160.0-r1.ebuild,v 1.1 2014/08/23 02:21:05 axs Exp $

EAPI=5

MODULE_AUTHOR=GBARR
MODULE_VERSION=2.16
inherit perl-module

DESCRIPTION="A Perl SASL interface"

SLOT="0"
KEYWORDS="*"
IUSE="kerberos"

DEPEND="dev-perl/Digest-HMAC
	kerberos? ( dev-perl/GSSAPI )"
RDEPEND="${DEPEND}"

SRC_TEST="do"
export OPTIMIZE="$CFLAGS"
