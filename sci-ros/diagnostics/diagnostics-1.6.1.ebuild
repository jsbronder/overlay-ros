# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Packages for gathering, viewing, and analyzing ROS diagnostics data"
HOMEPAGE="http://www.ros.org/wiki/diagnostics"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/pluginlib:${SLOT}
	|| ( dev-util/gtest dev-cpp/gtest )"
RDEPEND="${DEPEND}"

src_prepare() {
	echo 'add_definitions(-DTIXML_USE_STL)' \
		>> "${S}"/${PN}/diagnostic_aggregator/CMakeLists.txt \
		|| die
}
