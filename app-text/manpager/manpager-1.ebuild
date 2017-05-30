# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit toolchain-funcs

DESCRIPTION="Enable colorization of man pages"
HOMEPAGE="http://www.gentoo.org/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

S=${WORKDIR}

src_compile() {
	local cmd=(
		$(tc-getCC) ${CFLAGS} ${CPPFLAGS} ${LDFLAGS}
		"${FILESDIR}"/manpager.c -o ${PN}
	)
	echo "${cmd[@]}"
	"${cmd[@]}" || die
}

src_install() {
	dobin ${PN}
	insinto /etc/env.d
	echo "MANPAGER=manpager" | newins - 00manpager
}
