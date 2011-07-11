# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
ROS_DESTDIR="ros"
ROS_NEED_STACKS=0
WX_GTK_VER="2.8"
inherit ros wxwidgets

DESCRIPTION="An open-source, meta-operating system for your robot"
HOMEPAGE="http://www.ros.org/wiki/ROS"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="cturtle"

DEPEND="dev-python/pyyaml
	dev-python/epydoc
	dev-python/wxpython[cairo]
	dev-libs/log4cxx
	x11-libs/wxGTK:2.8[X]
	dev-python/matplotlib
	dev-python/paramiko
	dev-python/imaging
	dev-libs/boost
	sys-libs/db"
RDEPEND="${DEPEND}"

pkg_setup() {
	wxwidgets_pkg_setup
	return 0
}

src_prepare() {
	local f
	sed -i \
		-e 's,--rosdep-install,--disable-logging,' \
		${PN}/Makefile
	write_setup_file || die
}

src_compile() {
	"${S}"/setup_gentoo.sh make -C ${PN} || die
	"${S}"/setup_gentoo.sh rosmake \
		--mark-installed \
		--disable-logging \
		--no-rosdep \
		ros || die
}

src_install() {
	ros_src_install
	sed "s|@ROS_DIST@|$(ros_get_dist)|" "${FILESDIR}"/setup.sh \
		> "${D}"/opt/ros/$(ros_get_dist)/setup.sh || die
}

write_setup_file() {
	cat <<-"EOF" > "${S}"/setup_gentoo.sh
		#!/bin/bash
		TOPDIR=$(dirname $(readlink -f $0))

		export ROS_HOME=${TOPDIR}/roshome
		export ROS_ROOT=${TOPDIR}/ros
		export PATH=${ROS_ROOT}/bin:${PATH}
		export PYTHONPATH=${PYTHONPATH}:${ROS_ROOT}/core/roslib/src
		export ROS_MASTER_URI=${ROS_MASTER_URI:-http://localhost:11311}

		source ${ROS_ROOT}/tools/rosbash/rosbash

		$*
	EOF
	chmod +x "${S}"/setup_gentoo.sh
}
