# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
inherit ros python

DESCRIPTION="The basic geometric and math libraries used in ROS"
HOMEPAGE="http://www.ros.org/wiki/geometry"

LICENSE="BSD LGPL-2 ZLIB"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

COMMON_DEPEND="sci-ros/common_msgs:${SLOT}
	sci-ros/ros_comm:${SLOT}
	sci-ros/orocos_kinematics_dynamics:${SLOT}
	dev-cpp/eigen:3"

# Nothing appears to need bullet at runtime.
DEPEND="${COMMON_DEPEND}
	=sci-ros/bullet-2.76*:${SLOT}"
RDEPEND="${COMMON_DEPEND}"

pkg_setup() {
	ros_pkg_setup
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	cd "${S}"/${PN}
	# All documentation points to relying on external eigen now.
	sed -i -e '/package="eigen/d' \
		stack.xml */manifest.xml || die
}
