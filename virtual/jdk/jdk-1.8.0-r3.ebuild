# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

DESCRIPTION="Virtual for Java Development Kit (JDK)"
SLOT="1.8"
KEYWORDS="*"

RDEPEND="|| (
		dev-java/icedtea-bin:8
		dev-java/icedtea:8
		dev-java/oracle-jdk-bin:1.8
	)"
