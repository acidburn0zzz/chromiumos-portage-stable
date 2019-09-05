# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

inherit ruby-ng

DESCRIPTION="Virtual ebuild for rubygems"
SLOT="0"
KEYWORDS="*"

RDEPEND="
	ruby_targets_ruby24? ( >=dev-ruby/rubygems-2.6.11[ruby_targets_ruby24] )
	ruby_targets_ruby25? ( >=dev-ruby/rubygems-2.7.3[ruby_targets_ruby25] )
	ruby_targets_ruby26? ( >=dev-ruby/rubygems-3.0.1[ruby_targets_ruby26] )"

pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { eapply_user; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() { :; }
