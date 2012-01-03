# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="ROS build infrastructure plugin system"
HOMEPAGE="http://www.ros.org/wiki/pluginlib"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/ros_comm:${SLOT}
	dev-libs/tinyxml[stl]"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		's|cflags="\([^"]*\)"|cflags="\1 -DTIXML_USE_STL"|' \
		"${S}"/${PN}/manifest.xml || die
}
