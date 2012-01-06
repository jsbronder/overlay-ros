# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils ros

DESCRIPTION="ROS stack wrapping the Point Cloud Library"
HOMEPAGE="http://www.ros.org/wiki/perception_pcl"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/pluginlib:${SLOT}
	|| ( dev-util/gtest dev-cpp/gtest )
	sci-libs/vtk
	sci-libs/cminpack
	sci-libs/flann
	media-libs/qhull"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${ROS_S}" || die
	epatch "${FILESDIR}"/use-system-libs.patch
}
