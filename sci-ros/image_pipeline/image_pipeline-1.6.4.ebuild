# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="layer camera driver raw images and higher-level vision processing"
HOMEPAGE="http://www.ros.org/wiki/image_pipeline"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/driver_common:${SLOT}
	sci-ros/image_common:${SLOT}
	sci-ros/geometry:${SLOT}
	sci-ros/nodelet_core:${SLOT}
	sci-ros/vision_opencv:${SLOT}"
RDEPEND="${DEPEND}"
