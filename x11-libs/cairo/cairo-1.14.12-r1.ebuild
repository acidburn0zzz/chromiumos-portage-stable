# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils flag-o-matic autotools multilib-minimal

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://anongit.freedesktop.org/git/cairo"
	SRC_URI=""
	KEYWORDS="~*"
else
	SRC_URI="https://www.cairographics.org/releases/${P}.tar.xz"
	KEYWORDS="*"
fi

DESCRIPTION="A vector graphics library with cross-device output support"
HOMEPAGE="https://www.cairographics.org"
LICENSE="|| ( LGPL-2.1 MPL-1.1 )"
SLOT="0"
IUSE="X aqua debug gles2 +glib opengl static-libs +svg valgrind xcb"
# gtk-doc regeneration doesn't seem to work with out-of-source builds
#[[ ${PV} == *9999* ]] && IUSE="${IUSE} doc" # API docs are provided in tarball, no need to regenerate

# Test causes a circular depend on gtk+... since gtk+ needs cairo but test needs gtk+ so we need to block it
RESTRICT="test"

RDEPEND=">=dev-libs/lzo-2.06-r1[${MULTILIB_USEDEP}]
	>=media-libs/fontconfig-2.10.92[${MULTILIB_USEDEP}]
	>=media-libs/freetype-2.5.0.1:2[${MULTILIB_USEDEP}]
	>=media-libs/libpng-1.6.10:0=[${MULTILIB_USEDEP}]
	>=sys-libs/zlib-1.2.8-r1[${MULTILIB_USEDEP}]
	>=x11-libs/pixman-0.32.4[${MULTILIB_USEDEP}]
	gles2? ( >=media-libs/mesa-9.1.6[gles2,${MULTILIB_USEDEP}] )
	glib? ( >=dev-libs/glib-2.34.3:2[${MULTILIB_USEDEP}] )
	opengl? ( >=media-libs/mesa-9.1.6[egl,${MULTILIB_USEDEP}] )
	X? (
		>=x11-libs/libXrender-0.9.8[${MULTILIB_USEDEP}]
		>=x11-libs/libXext-1.3.2[${MULTILIB_USEDEP}]
		>=x11-libs/libX11-1.6.2[${MULTILIB_USEDEP}]
	)
	xcb? (
		>=x11-libs/libxcb-1.9.1[${MULTILIB_USEDEP}]
	)"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	>=sys-devel/libtool-2
	X? ( x11-base/xorg-proto )"
#[[ ${PV} == *9999* ]] && DEPEND="${DEPEND}
#	doc? (
#		>=dev-util/gtk-doc-1.6
#		~app-text/docbook-xml-dtd-4.2
#	)"

REQUIRED_USE="
	gles2? ( !opengl )
"

PATCHES=(
	"${FILESDIR}"/${PN}-1.12.18-disable-test-suite.patch
	"${FILESDIR}"/${PN}-respect-fontconfig.patch
)

src_prepare() {
	default
	if has_version ">=sys-libs/binutils-libs-2.34"; then
		eapply "${FILESDIR}"/${PN}-1.16.0-binutils-2.34.patch
	fi

	# tests and perf tools require X, bug #483574
	if ! use X; then
		sed -e '/^SUBDIRS/ s#boilerplate test perf# #' -i Makefile.am || die
	fi

	# Slightly messed build system YAY
	if [[ ${PV} == *9999* ]]; then
		touch boilerplate/Makefile.am.features
		touch src/Makefile.am.features
		touch ChangeLog
	fi

	eautoreconf
}

multilib_src_configure() {
	local myopts

	[[ ${CHOST} == *-interix* ]] && append-flags -D_REENTRANT

	use elibc_FreeBSD && myopts+=" --disable-symbol-lookup"
	[[ ${CHOST} == *-darwin* ]] && myopts+=" --disable-symbol-lookup"

	# TODO: remove this (and add USE-dep) when qtgui is converted, bug #498010
	if ! multilib_is_native_abi; then
		myopts+=" --disable-qt"
	fi

	# [[ ${PV} == *9999* ]] && myopts+=" $(use_enable doc gtk-doc)"

	ECONF_SOURCE="${S}" \
	econf \
		--disable-dependency-tracking \
		$(use_with X x) \
		$(use_enable X tee) \
		$(use_enable X xlib) \
		$(use_enable X xlib-xrender) \
		$(use_enable aqua quartz) \
		$(use_enable aqua quartz-image) \
		$(use_enable debug test-surfaces) \
		$(use_enable gles2 glesv2) \
		$(use_enable glib gobject) \
		$(use_enable opengl gl) \
		$(use_enable static-libs static) \
		$(use_enable svg) \
		$(use_enable valgrind) \
		$(use_enable xcb) \
		$(use_enable xcb xcb-shm) \
		--enable-ft \
		--enable-pdf \
		--enable-png \
		--enable-ps \
		--disable-drm \
		--disable-directfb \
		--disable-gallium \
		--disable-qt \
		--disable-vg \
		--disable-xlib-xcb \
		${myopts}
}

multilib_src_install_all() {
	prune_libtool_files --all
	einstalldocs
}