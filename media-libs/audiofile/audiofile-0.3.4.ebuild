# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/audiofile/audiofile-0.3.4.ebuild,v 1.9 2012/11/26 06:34:04 radhermit Exp $

EAPI="4"

inherit autotools eutils gnome.org

DESCRIPTION="An elegant API for accessing audio files"
HOMEPAGE="http://www.68k.org/~michael/audiofile/"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

DOCS=( ACKNOWLEDGEMENTS AUTHORS ChangeLog NEWS NOTES README TODO )

src_prepare() {
	# Don't build examples
	sed -i -e "/^SRC_SUBDIRS/s: examples::" Makefile.am || die

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		--disable-werror \
		--enable-largefile
}

src_test() {
	emake -C test check
}

src_install() {
	default
	prune_libtool_files
}
