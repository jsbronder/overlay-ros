# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils ros

DESCRIPTION="2D simulation using the Stage multi-robot simulator"
HOMEPAGE="http://www.ros.org/wiki/simulator_stage"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="sci-ros/geometry:${SLOT}
	media-libs/libpng
	virtual/jpeg"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/stage-add-gentoo-patches.patch
	ros_add_pkg_patches stage \
		gentoo-libstage-add-mising-libraries.patch
}
