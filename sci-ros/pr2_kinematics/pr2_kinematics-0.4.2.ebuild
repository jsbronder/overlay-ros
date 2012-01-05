# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="PR2 Kinematics"
HOMEPAGE="http://www.ros.org/wiki/pr2_kinematics"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/arm_navigation:${SLOT}
	sci-ros/geometry:${SLOT}"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${ROS_S}" || die
	sed -i '/package="eigen"/d' */manifest.xml
}
