# Copyright 1999-2012 Gentoo Foundation
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
SLOT="electric"

COMMON_DEPEND="sci-ros/geometry:${SLOT}
	net-misc/curl
	dev-libs/libpcre
	media-libs/assimp"
DEPEND="${COMMON_DEPEND}
	app-arch/unzip"
RDEPEND="${COMMON_DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/convex_decomposition-add-gentoo-patches.patch
	epatch "${FILESDIR}"/colladadom-add-gentoo-patches.patch
	# User flags patches
	ros_add_pkg_patches convex_decomposition \
		gentoo-convex_decomposition-respect-user-flags.patch
	ros_add_pkg_patches colladadom \
		gentoo-colladadom-respect-user-flags.patch

	# Set rpath so libminizip is found
	epatch "${FILESDIR}"/colladadom-set-ROS-install-rpath.patch

	# as-needed fix
	sed -i '/ROS_LINK_FLAGS/d' "${ROS_S}"/ivcon/CMakeLists.txt || die
	echo 'target_link_libraries(bin/ivcon -lm)' >> "${ROS_S}"/ivcon/CMakeLists.txt || die

	# This is supposed to be a rosdep
	sed -i '/package="assimp"/d' "${ROS_S}"/collada_urdf/manifest.xml || die

	# Fix use of tinyxml
	echo 'add_definitions(-DTIXML_USE_STL)' >> \
		"${ROS_S}"/urdf_parser/CMakeLists.txt || die
	sed -i 's|cflags="\([^"]*\)"|cflags="\1 -DTIXML_USE_STL"|' \
		"${ROS_S}"/urdf_parser/manifest.xml || die

	# missing link
	echo 'target_link_libraries(collada_urdf assimp)' >> \
		"${ROS_S}"/collada_urdf/CMakeLists.txt

	# At this point I gave up.  Everything in colladadom is pretty much
	# a mess.  Quickly looking at the output of ldd -r and objdump -x
	# is soul-crushing.  Therefore, expect any package dependant upon
	# robot_model to need to get linking correct.
}
