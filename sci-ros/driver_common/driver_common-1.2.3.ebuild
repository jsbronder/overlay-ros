# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Classes and tools used throughout the ROS driver stacks"
HOMEPAGE="http://www.ros.org/wiki/driver_common"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/diagnostics:${SLOT}"
RDEPEND="${DEPEND}"
