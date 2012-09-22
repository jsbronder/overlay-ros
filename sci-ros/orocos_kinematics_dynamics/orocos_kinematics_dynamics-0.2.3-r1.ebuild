# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
inherit eutils ros python

DESCRIPTION="Orocos kinematics and dynamics stack"
HOMEPAGE="http://www.ros.org/wiki/orocos_kinematics_dynamics"

LICENSE="LGPL-2.1 BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

COMMON_DEPEND="sci-ros/ros:${SLOT}"
DEPEND="${COMMON_DEPEND}
	dev-util/cppunit
	dev-python/sip"
RDEPEND="${COMMON_DEPEND}"

pkg_setup() {
	ros_pkg_setup
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	cd "${ROS_S}" || die

	# upstream 14396caaef3c2426ddeedff2d759bad424528b42
	epatch "${FILESDIR}"/orocos_kdl-bug-973.patch
	epatch "${FILESDIR}"/orocos-kdl-add-interpackage-rpath.patch
}
