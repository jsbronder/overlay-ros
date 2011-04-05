# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Contains the controllers that run in realtime on the PR2"
HOMEPAGE="http://www.ros.org/wiki/pr2_controllers"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/pr2_mechanism:${SLOT}
	sci-ros/visualization_common:${SLOT}"
RDEPEND="${DEPEND}"
