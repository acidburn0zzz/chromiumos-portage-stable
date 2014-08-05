# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/libiconv/libiconv-0-r1.ebuild,v 1.15 2014/06/18 20:55:19 mgorny Exp $

EAPI=4

inherit multilib-build

DESCRIPTION="Virtual for the GNU conversion library"
HOMEPAGE=""
SRC_URI=""
LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE="elibc_glibc elibc_uclibc elibc_musl elibc_mintlib"
DEPEND=""

# - Don't put elibc_glibc? ( sys-libs/glibc ) to avoid circular deps between
# that and gcc
RDEPEND="!elibc_glibc? ( !elibc_uclibc? ( !elibc_musl? ( !elibc_mintlib? ( >=dev-libs/libiconv-1.14-r1[${MULTILIB_USEDEP}] ) ) ) )"
