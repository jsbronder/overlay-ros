# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="ROS stack containting sound related drivers"
HOMEPAGE="http://www.ros.org/wiki/sound_drivers"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/common_msgs:${SLOT}"
RDEPEND="${DEPEND}"
