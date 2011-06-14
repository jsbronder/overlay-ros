# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
WX_GTK_VER="2.8"
inherit wxwidgets ros

DESCRIPTION="Packages for gathering, viewing, and analyzing ROS diagnostics data"
HOMEPAGE="http://www.ros.org/wiki/visualization_common"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

# rosdep:  freeimage, nvidia-cg-toolkit, x11-libs/libXrandr
DEPEND="sci-ros/common_msgs:${SLOT}
	x11-libs/libXaw
	media-libs/freeimage
	x11-libs/wxGTK:2.8"
RDEPEND="${DEPEND}"
