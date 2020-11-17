# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit flag-o-matic toolchain-funcs eutils

DESCRIPTION="Handy console-based calculator utility"
HOMEPAGE="https://www.gnu.org/software/bc/bc.html"
SRC_URI="mirror://gnu/bc/${P}.tar.gz"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="*"
IUSE="forced-sandbox libedit readline static"

RDEPEND="
	!readline? ( libedit? ( dev-libs/libedit:= ) )
	readline? (
		>=sys-libs/readline-4.1:0=
		>=sys-libs/ncurses-5.2:=
	)
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	virtual/yacc
"

PATCHES=(
	"${FILESDIR}/${PN}-1.07.1-sandbox.patch"
	"${FILESDIR}/${PN}-1.07.1-no-ed-its-sed.patch"
)

src_prepare() {
	epatch "${PATCHES[@]}"

	# Avoid bad build tool usage when cross-compiling.  #627126
	tc-is-cross-compiler && epatch "${FILESDIR}/${PN}-1.07.1-use-system-bc.patch"

	# A patch to make this into a configure option has been sent upstream,
	# but lets avoid regenerating all the autotools just for this.
	if use forced-sandbox ; then
		sed -i '/dc_sandbox_enabled = 0/s:0:1:' dc/dc.c || die
	fi
}

src_configure() {
	local myconf=(
		$(use_with readline)
	)
	if use readline ; then
		myconf+=( --without-libedit )
	else
		myconf+=( $(use_with libedit) )
	fi
	use static && append-ldflags -static

	econf "${myconf[@]}"

	# Do not regen docs -- configure produces a small fragment that includes
	# the version info which causes all pages to regen (newer file). #554774
	touch -r doc doc/*
}

src_compile() {
	emake AR="$(tc-getAR)"
}
