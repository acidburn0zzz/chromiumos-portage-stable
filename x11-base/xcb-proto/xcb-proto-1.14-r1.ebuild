# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )
XORG_TARBALL_SUFFIX="xz"
XORG_MODULE=proto/
XORG_MULTILIB=yes
XORG_STATIC=no

inherit python-r1 xorg-3

DESCRIPTION="X C-language Bindings protocol headers"
HOMEPAGE="https://xcb.freedesktop.org/ https://gitlab.freedesktop.org/xorg/proto/xcbproto"
EGIT_REPO_URI="https://gitlab.freedesktop.org/xorg/proto/xcbproto.git"

KEYWORDS="*"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
RDEPEND="
	${PYTHON_DEPS}
"
BDEPEND="
	${PYTHON_DEPS}
	dev-libs/libxml2
"

ECONF_SOURCE="${S}"

multilib_src_configure() {
	# Don't use Python to find sitedir here.
	PYTHON=true default
}

src_compile() {
	:
}

xcbgen_install() {
	# Use eclass to find sitedir instead.
	emake -C xcbgen install DESTDIR="${D}" pythondir="$(python_get_sitedir)"
	python_optimize
}

multilib_src_install() {
	# Restrict SUBDIRS to prevent xcbgen with empty sitedir.
	emake install DESTDIR="${D}" SUBDIRS=src
	multilib_is_native_abi && python_foreach_impl xcbgen_install
}
