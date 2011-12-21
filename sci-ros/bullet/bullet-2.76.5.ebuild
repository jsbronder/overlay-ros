# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="The basic geometric and math libraries used in ros."
HOMEPAGE="http://www.ros.org/wiki/bullet"

LICENSE="ZLIB"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/ros:${SLOT}"
RDEPEND="${DEPEND}"

ros_rpath_fix_function() {
	local comp=${1}
	local canon_path=${2}

	if [ -z "${comp##*/bullet/build/bullet_svn/*}" ]; then
		echo "${canon_path}/stacks/${ROS_STACK}/lib"
	else
		ros_default_rpath_fix_function $*
	fi
}
