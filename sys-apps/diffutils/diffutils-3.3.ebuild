# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/diffutils/diffutils-3.3.ebuild,v 1.14 2014/01/18 05:12:18 vapier Exp $

EAPI=4

inherit flag-o-matic

DESCRIPTION="Tools to make diffs and compare files"
HOMEPAGE="http://www.gnu.org/software/diffutils/"
SRC_URI="mirror://gnu-alpha/diffutils/${P}.tar.xz
	mirror://gnu/diffutils/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="nls static"

DEPEND="app-arch/xz-utils
	nls? ( sys-devel/gettext )"

DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )

src_prepare() {
	sed -i 's:@mkdir_p@:@MKDIR_P@:g' po/Makefile.in.in || die #464604
}

src_configure() {
	use static && append-ldflags -static

	# Disable automagic dependency over libsigsegv; see bug #312351.
	export ac_cv_libsigsegv=no

	econf \
		--with-packager="Gentoo" \
		--with-packager-version="${PVR}" \
		--with-packager-bug-reports="http://bugs.gentoo.org/" \
		$(use_enable nls)
}

src_test() {
	# explicitly allow parallel testing
	emake check
}
