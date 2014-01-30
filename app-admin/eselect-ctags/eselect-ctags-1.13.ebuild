# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/eselect-ctags/eselect-ctags-1.13.ebuild,v 1.7 2010/06/06 18:12:45 angelos Exp $

MY_P="eselect-emacs-${PV}"
DESCRIPTION="Manages ctags implementations"
HOMEPAGE="http://www.gentoo.org/proj/en/lisp/emacs/"
SRC_URI="mirror://gentoo/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND=">=app-admin/eselect-1.2.3
	!<=app-admin/eselect-emacs-1.3"

S="${WORKDIR}/${MY_P}"

src_compile() { :; }

src_install() {
	insinto /usr/share/eselect/modules
	doins ctags.eselect || die
	doman ctags.eselect.5 || die
}
