# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros eutils flag-o-matic

DESCRIPTION="Wrappers, tools and API's for using ROS with the Gazebo simulator."
HOMEPAGE="http://www.ros.org/wiki/simulator_gazebo"

LICENSE="BSD LGPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

# Needs freeimage, see Gentoo bug #307487
DEPEND="sci-ros/robot_model:${SLOT}
	sci-ros/physics_ode:${SLOT}
	sci-ros/visualization_common:${SLOT}
	sci-ros/driver_common:${SLOT}
	x11-libs/fltk:1
	media-libs/freeimage
	dev-libs/libyaml"
RDEPEND="${DEPEND}"

pkg_setup() {
	# This ends up being part of FLTK_LIBRARIES as a result of FindFLTK.cmake
	# picking up the flag.  Not sure how to fix this as builds by hand
	# with LDFLAGS exported work correctly.
	append-ldflags $(no-as-needed)
	ros_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}"/gazebo-add-patch-dir.patch
	ros_add_pkg_patches gazebo \
		gazebo-cmake-always-set-ogre-compile-flags.patch \
		gazebo-server-link-with-necessary-libraries.patch
}
