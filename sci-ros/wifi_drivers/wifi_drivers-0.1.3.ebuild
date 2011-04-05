# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Packages for gathering, viewing, and analyzing ROS diagnostics data"
HOMEPAGE="http://www.ros.org/wiki/diagnostics"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/visualization_common:${SLOT}
	sci-ros/pr2_common:${SLOT}"
RDEPEND="${DEPEND}"
