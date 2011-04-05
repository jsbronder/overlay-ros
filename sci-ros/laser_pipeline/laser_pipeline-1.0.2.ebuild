# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Libraries from processing laser data"
HOMEPAGE="http://www.ros.org/wiki/laser_pipeline"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/geometry:${SLOT}
	sci-ros/common:${SLOT}"
RDEPEND="${DEPEND}"
