# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils autotools autotools-utils

DESCRIPTION="Compiles finite state machines from regular languages into executable code"
HOMEPAGE="http://www.colm.net/open-source/ragel/"
SRC_URI="http://www.colm.net/files/ragel/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="vim-syntax"

DEPEND=""
RDEPEND=""

# We need to get the txl language in Portage to have the tests :(
RESTRICT=test

DOCS=( ChangeLog CREDITS README TODO )

src_test() {
	cd "${S}"/test
	./runtests.in || die
}

src_install() {
	autotools-utils_src_install

	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/syntax
		doins ragel.vim
	fi
}
