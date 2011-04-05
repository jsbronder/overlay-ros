# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Drivers for a variety of cameras, and some associated tools"
HOMEPAGE="http://www.ros.org/wiki/camera_drivers"

# TODO:  Commercial license?
# ROS incorrectly says camera1394 is GPL.  It's BSD and LGPL-2.1
LICENSE="BSD LGPL-2.1 GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/driver_common:${SLOT}
	sci-ros/image_common:${SLOT}
	sci-ros/geometry:${SLOT}"
RDEPEND="${DEPEND}"
