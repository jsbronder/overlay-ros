# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Contains GUI tools for working with PR2s"
HOMEPAGE="http://www.ros.org/wiki/pr2_gui"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/pr2_power_drivers:${SLOT}"
RDEPEND="${DEPEND}"
