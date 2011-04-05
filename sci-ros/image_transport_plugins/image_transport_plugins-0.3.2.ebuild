# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="plugins for publishing and subscribing to non-rwa sensor_msgs/Image topics"
HOMEPAGE="http://www.ros.org/wiki/image_transport_plugins"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/image_common:${SLOT}
	sci-ros/driver_common:${SLOT}
	sci-ros/vision_opencv:${SLOT}
	media-libs/libogg"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's,\(-ltheora \),\1-logg ,' \
		"${ROS_S}"/libtheora/manifest.xml || die
}
