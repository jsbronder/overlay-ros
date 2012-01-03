# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="plugins for publishing and subscribing to non-rwa sensor_msgs/Image topics"
HOMEPAGE="http://www.ros.org/wiki/image_transport_plugins"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/image_common:${SLOT}
	sci-ros/driver_common:${SLOT}
	sci-ros/vision_opencv:${SLOT}
	media-libs/libtheora"
RDEPEND="${DEPEND}"
