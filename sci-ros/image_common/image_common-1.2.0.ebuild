# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Common code for working with images in ROS"
HOMEPAGE="http://www.ros.org/wiki/image_common"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/common:${SLOT}"
RDEPEND="${DEPEND}"
