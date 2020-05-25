# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools eutils multilib-minimal

DESCRIPTION="A high-performance event loop/event model with lots of feature"
HOMEPAGE="http://software.schmorp.de/pkg/libev.html"
SRC_URI="http://dist.schmorp.de/libev/${P}.tar.gz
	http://dist.schmorp.de/libev/Attic/${P}.tar.gz"

LICENSE="|| ( BSD GPL-2 )"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

DOCS=( Changes README )

src_prepare() {
	sed -i -e "/^include_HEADERS/s/ event.h//" Makefile.am || die

	# bug #411847
	epatch "${FILESDIR}/${PN}-pc.patch"

	epatch_user
	eautoreconf
}

multilib_src_configure() {
	ECONF_SOURCE="${S}" \
	econf \
		--disable-maintainer-mode \
		$(use_enable static-libs static)
}

multilib_src_install_all() {
	use static-libs || prune_libtool_files
	einstalldocs
}
