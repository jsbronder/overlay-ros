# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros eutils

DESCRIPTION="ROS communications-related packages"
HOMEPAGE="http://www.ros.org/wiki/ros_comm"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/ros:${SLOT}
	dev-libs/apr[uuid]
	dev-libs/apr-util
	app-arch/bzip2
	dev-libs/log4cxx
	dev-libs/boost"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${S}"/"${PN}"
	epatch "${FILESDIR}"/rosout-prefer-config-file-for-logging.patch
}
