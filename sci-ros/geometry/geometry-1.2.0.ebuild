# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="The basic geometric and math libraries used in ROS"
HOMEPAGE="http://www.ros.org/wiki/geometry"

LICENSE="BSD LGPL-2 ZLIB"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/common_msgs:${SLOT}
	dev-libs/boost
	media-libs/freeglut"
# rosdep.yaml claims dev-python/sip
RDEPEND="${DEPEND}"

geometry_rpath_fix_function() {
	local comp=${1}
	local canon_path=${2}

	if [ -z "${comp##*/bullet/build/bullet_svn/*}" ]; then
		echo "${canon_path}/stacks/geometry/bullet/lib"
	else
		ros_default_rpath_fix_function $*
	fi
}

ros_rpath_fix_function() {
	geometry_rpath_fix_function $*
}
