# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Contains the controllers that run in realtime on the PR2"
HOMEPAGE="http://www.ros.org/wiki/pr2_controllers"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/pr2_mechanism:${SLOT}
	sci-ros/control:${SLOT}"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${ROS_S}" || die
	sed -i '/package="eigen"/d' pr2_mechanism_controllers/manifest.xml || die
}
