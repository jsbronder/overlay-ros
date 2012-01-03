# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Drivers relating to Inertial Measurement Units"
HOMEPAGE="http://www.ros.org/wiki/imu_drivers"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/diagnostics:${SLOT}
	sci-ros/geometry:${SLOT}"
RDEPEND="${DEPEND}"
