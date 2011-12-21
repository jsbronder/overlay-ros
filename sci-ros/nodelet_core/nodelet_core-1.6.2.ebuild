# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="Nodelets library and tools"
HOMEPAGE="http://www.ros.org/wiki/nodelet_core"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/pluginlib:${SLOT}
	sci-ros/bond_core:${SLOT}"
RDEPEND="${DEPEND}"
