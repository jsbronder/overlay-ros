# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Common code for working with images in ROS"
HOMEPAGE="http://www.ros.org/wiki/image_common"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/common_msgs:${SLOT}
	sci-ros/pluginlib:${SLOT}
	dev-cpp/yaml-cpp"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${ROS_S}"
	sed -i '/package="common_rosdeps"/d' \
		camera_calibration_parsers/manifest.xml \
		|| die
}
