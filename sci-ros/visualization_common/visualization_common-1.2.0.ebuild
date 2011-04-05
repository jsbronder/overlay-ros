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

# rosdep:  freeimage, nvidia-cg-toolkit, x11-libs/libXrandr
DEPEND="sci-ros/common_msgs:${SLOT}"
RDEPEND="${DEPEND}"
