# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Packages for gathering, viewing, and analyzing ROS diagnostics data"
HOMEPAGE="http://www.ros.org/wiki/diagnostics"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/common:${SLOT}
	sci-ros/laser_pipeline:${SLOT}
	sci-ros/driver_common:${SLOT}
	sci-ros/visualization_common:${SLOT}
	sci-ros/perception_pcl:${SLOT}
	media-libs/netpbm
	media-libs/sdl-image"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${ROS_S}" || die
	sed -i \
		-e '/eigen/d' \
		-e 's|\(cflags="\)|\1-I/usr/include/eigen3|' \
		dwa_local_planner/manifest.xml || die
}
