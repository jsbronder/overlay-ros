# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="PR2-specific simulation components"
HOMEPAGE="http://www.ros.org/wiki/pr2_simulator"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/image_pipeline:${SLOT}
	sci-ros/simulator_gazebo:${SLOT}
	sci-ros/pr2_controllers:${SLOT}"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's,exec_program.*glxinfo.*,set(glx_val 0),' \
		"${ROS_S}"/pr2_gazebo_plugins/CMakeLists.txt || die
}
