# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros eutils

DESCRIPTION="Wrapper around the OpenSlam gmapping package"
HOMEPAGE="http://www.ros.org/wiki/slam_gmapping"

LICENSE="CCPL-Attribution-ShareAlike-NonCommercial-2.5"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/navigation:${SLOT}"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/gmapping-add-gentoo-patches.patch
	ros_add_pkg_patches gmapping \
		gentoo-gmapping_export-append-libs-to-LIBS-not-LDFLAGS.patch
}
