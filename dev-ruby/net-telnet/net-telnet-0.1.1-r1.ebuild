# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

# Don't install the binaries since they don't seem to be intended for
# general use and they have very generic names leading to collisions,
# e.g. bug 571186
RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem

DESCRIPTION="Provides telnet client functionality"
HOMEPAGE="https://github.com/ruby/net-telnet"
SRC_URI="https://github.com/ruby/net-telnet/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( Ruby-BSD BSD-2 )"
SLOT="1"
KEYWORDS="*"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/minitest )"

all_ruby_prepare() {
	sed -i -e '/bundler/ s:^:#:' Rakefile || die
}