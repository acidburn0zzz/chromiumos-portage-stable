# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/vim-core/vim-core-7.3.762.ebuild,v 1.13 2014/06/06 06:04:05 vapier Exp $

EAPI=3
VIM_VERSION="7.3"
inherit vim

VIM_CORE_GENTOO_PATCHES="vim-core-${VIM_VERSION}-gentoo-patches-r2.tar.bz2"
VIM_ORG_PATCHES="vim-patches-${PV}.patch.bz2"
VIMRC_FILE_SUFFIX="-r4"

SRC_URI="ftp://ftp.vim.org/pub/vim/unix/vim-${VIM_VERSION}.tar.bz2
	http://dev.gentoo.org/~lack/vim/${VIM_CORE_GENTOO_PATCHES}
	http://dev.gentoo.org/~lack/vim/${VIM_ORG_PATCHES}"

S="${WORKDIR}/vim${VIM_VERSION/.}"
DESCRIPTION="vim and gvim shared files"
KEYWORDS="*"
IUSE=""
