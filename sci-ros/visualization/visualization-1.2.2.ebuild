# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Visualization tools for robots"
HOMEPAGE="http://www.ros.org/wiki/visualization"

LICENSE="BSD wxWinLL-3.1 CC-PD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/common:${SLOT}
	sci-ros/laser_pipeline:${SLOT}
	sci-ros/robot_model:${SLOT}
	sci-ros/visualization_common:${SLOT}
	sci-ros/image_common:${SLOT}"
RDEPEND="${DEPEND}"
