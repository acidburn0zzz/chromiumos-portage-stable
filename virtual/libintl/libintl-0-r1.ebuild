# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/libintl/libintl-0-r1.ebuild,v 1.13 2014/09/15 08:24:31 ago Exp $

EAPI=4

inherit multilib-build

DESCRIPTION="Virtual for the GNU Internationalization Library"
HOMEPAGE=""
SRC_URI=""
LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE="elibc_glibc elibc_uclibc"
DEPEND=""

# - Don't put elibc_glibc? ( sys-libs/glibc ) to avoid circular deps between
# that and gcc. And don't force uClibc to dep on this.
RDEPEND="!elibc_glibc? ( !elibc_uclibc? ( !elibc_musl? ( >=sys-devel/gettext-0.18.3.2[${MULTILIB_USEDEP}] ) ) )"
