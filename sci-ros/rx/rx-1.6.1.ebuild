# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
WX_GTK_VER="2.8"
inherit ros wxwidgets

DESCRIPTION="GUI tools for ROS: rxbag, rxplot, rxgraph, and others"
HOMEPAGE="http://www.ros.org/wiki/rx"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/ros_comm:${SLOT}
	x11-libs/wxGTK:2.8[X]"
RDEPEND="${DEPEND}"
