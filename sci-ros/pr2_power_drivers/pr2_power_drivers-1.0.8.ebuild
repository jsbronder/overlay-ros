# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Power drivers for the PR2 robot"
HOMEPAGE="http://www.ros.org/wiki/pr2_power_drivers"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/diagnostics:${SLOT}
	sci-ros/driver_common:${SLOT}
	sci-ros/pr2_common:${SLOT}"
RDEPEND="${DEPEND}"
