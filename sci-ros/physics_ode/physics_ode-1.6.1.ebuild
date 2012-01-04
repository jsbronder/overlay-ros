# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils ros

DESCRIPTION="Open Dynamics Physics Engines for Simulation and Planning"
HOMEPAGE="http://www.ros.org/wiki/physics_ode"

LICENSE="BSD LGPL-2.1 Boost-1.0"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

DEPEND="sci-ros/ros:${SLOT}
	dev-libs/boost"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s|\(LDFLAGS='\)|\1\$(LDFLAGS) |" \
		"${ROS_S}"/opende/Makefile.ode.tarball || die
}
