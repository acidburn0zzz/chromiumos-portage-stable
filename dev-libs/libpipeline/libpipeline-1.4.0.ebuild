# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit autotools-utils

DESCRIPTION="a pipeline manipulation library"
HOMEPAGE="http://libpipeline.nongnu.org/"
SRC_URI="mirror://nongnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs test"

DEPEND="virtual/pkgconfig
	test? ( dev-libs/check )"
