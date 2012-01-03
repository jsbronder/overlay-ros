# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Packaging of OpenCV for ROS"
HOMEPAGE="http://www.ros.org/wiki/vision_opencv"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/common_msgs:${SLOT}
	sci-ros/geometry:${SLOT}
	>=media-libs/opencv-2.3"
RDEPEND="${DEPEND}"

src_prepare() {
	# Fix pkgconfig filename
	sed -i 's|opencv-2.3.1|opencv|g' "${S}"/${PN}/opencv2/manifest.xml || die
}
