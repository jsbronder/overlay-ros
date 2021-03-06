# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Commonly used tools built on top of ROS core"
HOMEPAGE="http://www.ros.org/wiki/common"

LICENSE="LGPL-2.1 ZLIB Boost-1.0 MPL-1.1 BSD MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/common_msgs:${SLOT}
	sci-ros/nodelet_core:${SLOT}
	sci-ros/filters:${SLOT}
	sci-ros/xacro:${SLOT}"
# Listed as a dep, but I haven't noticed it been necessary.
# media-libs/sdl-image"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's|cflags="\([^"\]*\)"|cflags="\1 -DTIXML_USE_STL"|' \
		"${ROS_S}"/tinyxml/manifest.xml || die
}

ros_cleanup_function() {
	local f

	for f in $(find "${ROS_S}" -type d -name 'build'); do
		rm -rf "${f}"
	done

	for f in $(find "${ROS_S}" -type f -name '*.cpp' | grep -v 'include/bfl/'); do
		rm -f "${f}"
	done
}

src_install() {
	ROS_KEEP_FILES=$(find "${ROS_S}" -type f -name '*.h' \
		-exec grep '#include .*\.cpp' {} \; \
		| sed 's,#include "\([^"]*\)".*,\1,')
	ros_src_install
	# Programs are only used during test.
	rm -r "${D}"/opt/ros/$(ros_get_dist)/${ROS_DESTDIR}/bfl/bin
}
