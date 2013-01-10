# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros eutils

DESCRIPTION="ROS node interface to the Kinect"
HOMEPAGE="http://www.ros.org/wiki/openni_kinect"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/image_pipeline:${SLOT}
	sci-ros/perception_pcl:${SLOT}
	media-libs/openni"
RDEPEND="${DEPEND}"

