# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib-build

DESCRIPTION="Virtual for libcrypt.so"

SLOT="0/1"
KEYWORDS="*"
IUSE="+static-libs"

RDEPEND="
	elibc_glibc? ( sys-libs/glibc[crypt(+),static-libs(+)?] )
	elibc_musl? ( sys-libs/musl )
	elibc_uclibc? ( sys-libs/uclibc-ng )
	elibc_Cygwin? ( sys-libs/cygwin-crypt )
"
