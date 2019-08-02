# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Tool to measure IP bandwidth using UDP or TCP"
HOMEPAGE="http://iperf2.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}2/${P}.tar.gz"

LICENSE="HPND"
SLOT="2"
KEYWORDS="*"
IUSE="ipv6 threads debug"
inherit eutils

DOCS="INSTALL README"

src_configure() {
	econf \
		$(use_enable debug debuginfo) \
		$(use_enable ipv6) \
		$(use_enable threads)
	# Modify config.h to use _Bool for C only.
	epatch "${FILESDIR}"/${PN}-2-bool.patch
}

src_install() {
	default
	dodoc doc/*
	newinitd "${FILESDIR}"/${PN}.initd-r1 ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
}
