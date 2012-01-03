# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Messages that are widely used by other ROS packages"
HOMEPAGE="http://www.ros.org/wiki/common_msgs"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/ros_comm:${SLOT}"
RDEPEND="${DEPEND}"
