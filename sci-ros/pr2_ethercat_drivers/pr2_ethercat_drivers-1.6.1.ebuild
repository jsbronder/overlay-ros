# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="drivers for the ethercat system and the connecting peripherals"
HOMEPAGE="http://www.ros.org/wiki/pr2_ethercat_drivers"

# TODO:  Not complete, EtherCAT has some strange licensing stuff going on.
LICENSE="BSD GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/diagnostics:${SLOT}
	sci-ros/pr2_mechanism:${SLOT}
	sci-ros/visualization_common:${SLOT}"
RDEPEND="${DEPEND}"
