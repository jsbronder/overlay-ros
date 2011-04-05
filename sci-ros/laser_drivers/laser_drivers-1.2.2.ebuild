# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Drivers for laser rangefinders"
HOMEPAGE="http://www.ros.org/wiki/laser_drivers"

LICENSE="BSD LGPL-2.1"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/driver_common:${SLOT}"
RDEPEND="${DEPEND}"
