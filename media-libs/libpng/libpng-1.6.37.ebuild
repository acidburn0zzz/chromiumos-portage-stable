# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit libtool multilib-minimal

DESCRIPTION="Portable Network Graphics library"
HOMEPAGE="http://www.libpng.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.xz
	apng? ( mirror://sourceforge/apng/${P}-apng.patch.gz )"

LICENSE="libpng2"
SLOT="0/16"
KEYWORDS="*"
IUSE="apng cpu_flags_x86_sse neon static-libs"

RDEPEND=">=sys-libs/zlib-1.2.8-r1:=[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}
	app-arch/xz-utils"

src_prepare() {
	default
	if use apng; then
		eapply -p0 "${WORKDIR}"/${PN}-*-apng.patch
		# Don't execute symbols check with apng patch wrt #378111
		sed -i -e '/^check/s:scripts/symbols.chk::' Makefile.in || die
	fi
	elibtoolize
}

multilib_src_configure() {
	local myeconfargs=(
		$(use_enable cpu_flags_x86_sse intel-sse)
		$(use_enable static-libs static)
		--enable-arm-neon=$(usex neon)
	)
	ECONF_SOURCE="${S}" econf "${myeconfargs[@]}"
}

multilib_src_install_all() {
	DOCS=( ANNOUNCE CHANGES libpng-manual.txt README TODO )
	einstalldocs
	find "${ED}" -name '*.la' -delete || die
}
