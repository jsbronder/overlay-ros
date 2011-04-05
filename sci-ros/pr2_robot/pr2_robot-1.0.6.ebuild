# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="PR2-specific components that are used in bringing up a robot"
HOMEPAGE="http://www.ros.org/wiki/pr2_robot"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/wifi_drivers:${SLOT}
	sci-ros/imu_drivers:${SLOT}
	sci-ros/joystick_drivers:${SLOT}
	sci-ros/laser_drivers:${SLOT}
	sci-ros/pr2_controllers:${SLOT}
	sci-ros/pr2_ethercat_drivers:${SLOT}
	sci-ros/pr2_power_drivers:${SLOT}
	sci-ros/sound_drivers:${SLOT}"
RDEPEND="${DEPEND}"
