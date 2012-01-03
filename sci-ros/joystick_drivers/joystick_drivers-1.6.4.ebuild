# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit ros eutils

DESCRIPTION="ROS node interface to joysticks and extra drivers"
HOMEPAGE="http://www.ros.org/wiki/joystick_drivers"

# ROS incorrectly says that spacenav is ZLIB
# wiimote just says GPL
LICENSE="BSD GPL-3 GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="electric"

# rosdep.yaml:  games-util/joysticks dev-libs/libusb
# dev-python/pybluez net-wireless/bluez-utils (bluez-utils and libs)
# sys-devel/flex sys-devel/bison
DEPEND="sci-ros/diagnostics:${SLOT}
	net-wireless/bluez"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/cwiid-add-gentoo-patches.patch
	epatch "${FILESDIR}"/spacenav-add-gentoo-patches.patch
	ros_add_pkg_patches cwiid \
		gentoo-fix-shlib-build-with-as-needed.patch
	ros_add_pkg_patches spacenav \
		gentoo-spacenav-respect-user-compile-flags.patch
}
