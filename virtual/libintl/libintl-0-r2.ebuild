# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit multilib-build

DESCRIPTION="Virtual for the GNU Internationalization Library"

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE="elibc_glibc elibc_musl elibc_uclibc"

# - Don't put elibc_glibc? ( sys-libs/glibc ) to avoid circular deps between
# that and gcc. And don't force uClibc to dep on this.
RDEPEND="!elibc_glibc? ( !elibc_uclibc? ( !elibc_musl? ( dev-libs/libintl[${MULTILIB_USEDEP}] ) ) )"
