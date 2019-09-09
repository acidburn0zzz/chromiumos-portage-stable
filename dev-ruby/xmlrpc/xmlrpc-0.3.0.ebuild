# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="XMLRPC is a lightweight protocol that enables remote procedure calls over HTTP"
HOMEPAGE="https://github.com/ruby/xmlrpc"
SRC_URI="https://github.com/ruby/xmlrpc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="*"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/test-unit )"

all_ruby_prepare() {
	sed -i -e '/bundler/ s:^:#:' Rakefile || die

	# Avoid dependency on git
	sed -i -e 's/git ls-files -z/find * -print0/' ${RUBY_FAKEGEM_GEMSPEC} || die
}
