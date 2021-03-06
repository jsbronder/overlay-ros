# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils ros

DESCRIPTION="Libraries from processing laser data"
HOMEPAGE="http://www.ros.org/wiki/laser_pipeline"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/geometry:${SLOT}
	sci-ros/pluginlib:${SLOT}
	sci-ros/filters:${SLOT}"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${ROS_S}" || die

	sed -i \
		-e '/common_rosdeps/d' \
		-e '/package="eigen"/d'\
		-e 's|\(cflags="\)|\1-I/usr/include/eigen3 |' \
		laser_geometry/manifest.xml || die

	epatch "${FILESDIR}"/laser_pipeline-use-system-eigen3.patch
}
