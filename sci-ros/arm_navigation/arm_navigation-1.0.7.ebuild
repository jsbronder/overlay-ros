# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
# sci-ros/visualization uses wxwidgets
WX_GTK_VER="2.8"
inherit eutils wxwidgets ros

DESCRIPTION="Packages that permit collision-free arm navigation"
HOMEPAGE="http://www.ros.org/wiki/arm_navigation"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/control:${SLOT}
	sci-ros/perception_pcl:${SLOT}
	sci-ros/physics_ode:${SLOT}
	sci-ros/visualization:${SLOT}
	media-libs/netpbm
	media-libs/sdl-image"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/geometric_shapes-use-system-assimp.patch

	cd "${ROS_S}" || die
	sed -i \
		-e '/package="assimp"/d' \
		*/manifest.xml
}
