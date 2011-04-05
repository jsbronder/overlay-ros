# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Metapackage for the PR2 ROS Cturtle Packages"
HOMEPAGE="http://www.ros.org"
SRC_URI=""

LICENSE="BSD"
SLOT="cturtle"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sci-ros/ros:${SLOT}
	sci-ros/pr2_common:${SLOT}
	sci-ros/pr2_mechanism:${SLOT}
	sci-ros/pr2_controllers:${SLOT}
	sci-ros/pr2_apps:${SLOT}
	sci-ros/pr2_ethercat_drivers:${SLOT}
	sci-ros/pr2_power_drivers:${SLOT}
	sci-ros/pr2_gui:${SLOT}
	sci-ros/pr2_robot:${SLOT}
	sci-ros/pr2_simulator:${SLOT}"
RDEPEND="${DEPEND}"
