# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
WX_GTK_VER="2.8"
inherit wxwidgets ros

DESCRIPTION="Packages for gathering, viewing, and analyzing ROS diagnostics data"
HOMEPAGE="http://www.ros.org/wiki/visualization_common"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/ros_comm:${SLOT}
	sci-ros/rx:${SLOT}
	x11-libs/libXaw
	media-libs/freeimage
	x11-libs/wxGTK:2.8
	media-gfx/nvidia-cg-toolkit"
RDEPEND="${DEPEND}"

src_prepare() {
	local plugin_def="'-DOGRE_PLUGIN_PATH=\"${ROOT}${ROS_DIST_ROOT}/${ROS_DESTDIR}/ogre/ogre/lib/OGRE\"'"
	sed -i "s|^add_definitions(\(.*\))|add_definitions(\1 ${plugin_def})|" \
		${PN}/ogre_tools/CMakeLists.txt|| die

	sed -i  '/package="common_rosdeps"/d' ${PN}/*/manifest.xml

	# TODO: Ogre needs a lot of rpath fixes.
}
