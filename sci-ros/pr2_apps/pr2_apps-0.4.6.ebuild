# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Basic applications for the PR2 robot"
HOMEPAGE="http://www.ros.org/wiki/pr2_apps"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/arm_navigation:${SLOT}
	sci-ros/joystick_drivers:${SLOT}
	sci-ros/pr2_controllers:${SLOT}
	sci-ros/pr2_common_actions:${SLOT}"
RDEPEND="${DEPEND}"
