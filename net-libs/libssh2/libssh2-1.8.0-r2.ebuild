# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit multilib-minimal

DESCRIPTION="Library implementing the SSH2 protocol"
HOMEPAGE="https://www.libssh2.org"
SRC_URI="https://www.${PN}.org/download/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="gcrypt libressl static-libs test zlib"

# Hack: Unslotted OpenSSL dependency to allow cargo to continue using OpenSSL
# 1.0.2 across the OpenSSL 1.1 uprev. To be switched back to slotted dependency
# after the OpenSSL uprev is done.
RDEPEND="
	!gcrypt? (
		!libressl? ( >=dev-libs/openssl-1.0.1h-r2[${MULTILIB_USEDEP}] )
		libressl? ( dev-libs/libressl:0=[${MULTILIB_USEDEP}] )
	)
	gcrypt? ( >=dev-libs/libgcrypt-1.5.3:0[${MULTILIB_USEDEP}] )
	zlib? ( >=sys-libs/zlib-1.2.8-r1[${MULTILIB_USEDEP}] )
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${PN}-1.8.0-libgcrypt-prefix.patch
	"${FILESDIR}"/${PN}-1.8.0-mansyntax_sh.patch
	"${FILESDIR}"/${PN}-1.8.0-openssl11.patch
	"${FILESDIR}"/${PN}-1.8.0-openssl11-memleak.patch
)

multilib_src_configure() {
	# Disable tests that require extra permissions (bug #333319)
	use test && local -x ac_cv_path_SSHD=

	ECONF_SOURCE=${S} econf \
		$(use_with zlib libz) \
		$(usex gcrypt --with-libgcrypt --with-openssl) \
		$(use_enable static-libs static)
}

multilib_src_install_all() {
	einstalldocs
	find "${D}" -name '*.la' -delete || die
}
