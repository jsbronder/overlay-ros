# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros eutils

DESCRIPTION="Packages for modeling various aspects of robot information"
HOMEPAGE="http://www.ros.org/wiki/robot_model"

# ROS says GPL due to ivcon, but there's no sign of a license for ivcon.
LICENSE="BSD MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/common:${SLOT}
	sci-ros/geometry:${SLOT}"
# rosdep.yaml claims dev-libs/libpcre
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/convex_decomposition-add-gentoo-patches.patch
	epatch "${FILESDIR}"/colladadom-add-gentoo-patches.patch
	# User flags patches
	ros_add_pkg_patches convex_decomposition \
		gentoo-convex_decomposition-respect-user-flags.patch
	ros_add_pkg_patches colladadom \
		gentoo-colladadom-respect-user-flags.patch

	# as-needed fix
	sed -i '/ROS_LINK_FLAGS/d' "${ROS_S}"/ivcon/CMakeLists.txt || die
	echo 'target_link_libraries(bin/ivcon -lm)' >> "${ROS_S}"/ivcon/CMakeLists.txt || die
}
