# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24 ruby25"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGES README.rdoc TODO"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_BINDIR="exe"

inherit bash-completion-r1 ruby-fakegem

DESCRIPTION="Make-like scripting in Ruby"
HOMEPAGE="https://github.com/ruby/rake"
SRC_URI="https://github.com/ruby/rake/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="doc"

DEPEND+=" app-arch/gzip"

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.8 )
	doc? ( dev-ruby/rdoc )"

all_ruby_prepare() {
	sed -i -e '/coverall/I s:^:#:' test/helper.rb || die
}

all_ruby_compile() {
	if use doc; then
		rdoc --title "Rake - Ruby Make" --main README.rdoc --out html lib *.rdoc doc/*/*.rdoc || die
	fi
}

each_ruby_test() {
	${RUBY} -Ilib:test:. -e 'gem "minitest", "~>5.8"; require "minitest/autorun"; Dir["test/test_*.rb"].each{|f| require f}' || die
}

all_ruby_install() {
	ruby_fakegem_binwrapper rake

	if use doc; then
		pushd html
		dodoc -r *
		popd
	fi

	doman doc/rake.1

	newbashcomp "${FILESDIR}"/rake.bash-completion ${PN}
}
