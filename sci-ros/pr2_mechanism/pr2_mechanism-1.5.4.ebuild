# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Infrastructure to control the PR2 robot in a hard realtime control loop"
HOMEPAGE="http://www.ros.org/wiki/pr2_mechanism"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/robot_model:${SLOT}
	sci-ros/diagnostics:${SLOT}
	sci-ros/pr2_common:${SLOT}"
RDEPEND="${DEPEND}"
