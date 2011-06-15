# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Packaging of OpenCV for ROS"
HOMEPAGE="http://www.ros.org/wiki/vision_opencv"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

# rosdep.yaml claims imagemagick 
COMMON_DEPEND="sci-ros/common_msgs:${SLOT}
	sys-libs/zlib
	media-libs/libdc1394:2
	>=media-video/ffmpeg-0.5
	media-libs/jasper
	media-libs/libpng"
DEPEND="${COMMON_DEPEND}
	dev-vcs/subversion[webdav-neon]"
RDEPEND="${DEPEND}"

src_prepare() {
	cp "${FILESDIR}"/opencv-2.0.0-libpng14.patch "${ROS_S}"/opencv2/ || die
	sed -i 's,\(SVN_PATCH =.*\),\1 opencv-2.0.0-libpng14.patch,' \
		"${ROS_S}"/opencv2/Makefile
}
