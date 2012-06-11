# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
WX_GTK_VER="2.8"
inherit ros wxwidgets

DESCRIPTION="A simple GUI tool for displaying robot diagnostics"
HOMEPAGE="http://www.ros.org/wiki/diagnostics_monitors"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/common_msgs:${SLOT}"
RDEPEND="${DEPEND}"
