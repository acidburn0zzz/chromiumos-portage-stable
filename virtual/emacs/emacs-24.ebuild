# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/emacs/emacs-24.ebuild,v 1.13 2014/01/16 17:48:59 vapier Exp $

EAPI=4

DESCRIPTION="Virtual for GNU Emacs"
SLOT="0"
KEYWORDS="*"

RDEPEND="|| ( app-editors/emacs:24
		>=app-editors/emacs-vcs-24.1 )"
