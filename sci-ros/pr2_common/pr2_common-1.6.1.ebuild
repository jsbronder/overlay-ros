# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="PR2 specific messages and definitions"
HOMEPAGE="http://www.ros.org/wiki/pr2_common"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/robot_model:${SLOT}
	sci-ros/xacro:${SLOT}"
RDEPEND="${DEPEND}"
