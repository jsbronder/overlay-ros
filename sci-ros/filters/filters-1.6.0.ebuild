# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros

DESCRIPTION="ROS interface for processing data as a sequence of filters"
HOMEPAGE="http://www.ros.org/wiki/filters"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/pluginlib:${SLOT}"
RDEPEND="${DEPEND}"
