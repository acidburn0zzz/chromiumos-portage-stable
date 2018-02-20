# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit multilib toolchain-funcs eutils multilib-minimal

MY_P="${P//_/-}"
MY_RELEASEDATE="20170804"

DESCRIPTION="SELinux binary policy representation library"
HOMEPAGE="https://github.com/SELinuxProject/selinux/wiki"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/SELinuxProject/selinux.git"
	S="${WORKDIR}/${MY_P}/${PN}"
else
	SRC_URI="https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/${MY_RELEASEDATE}/${MY_P}.tar.gz"
	KEYWORDS="*"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

# tests are not meant to be run outside of the full SELinux userland repo
RESTRICT="test"

src_prepare() {
	epatch_user
	epatch "${FILESDIR}/libsepol-2.7-add-ability-to-redeclare-types-attributes.patch"
	epatch "${FILESDIR}/libsepol-2.7-keep-attributes-used-by-generated-attributes-in-neverallow-rules.patch"
	epatch "${FILESDIR}/libsepol-2.7-create-new-keep-field-for-type-attribute-sets.patch"
	multilib_copy_sources
}

multilib_src_compile() {
	tc-export RANLIB;
	LIBDIR="\$(PREFIX)/$(get_libdir)" SHLIBDIR="\$(DESTDIR)/$(get_libdir)" \
		emake AR="$(tc-getAR)" CC="$(tc-getCC)"
}

multilib_src_install() {
	LIBDIR="\$(PREFIX)/$(get_libdir)" SHLIBDIR="\$(DESTDIR)/$(get_libdir)" \
		emake DESTDIR="${D}" install
}
