# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Metapackage for the ROS Cturtle Distribution"
HOMEPAGE="http://www.ros.org"
SRC_URI=""

LICENSE="BSD"
SLOT="cturtle"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sci-ros/ros:${SLOT}
	sci-ros/common_msgs:${SLOT}
	sci-ros/common:${SLOT}
	sci-ros/camera_drivers:${SLOT}
	sci-ros/diagnostics:${SLOT}
	sci-ros/driver_common:${SLOT}
	sci-ros/geometry:${SLOT}
	sci-ros/image_common:${SLOT}
	sci-ros/vision_opencv:${SLOT}
	sci-ros/image_pipeline:${SLOT}
	sci-ros/image_transport_plugins:${SLOT}
	sci-ros/imu_drivers:${SLOT}
	sci-ros/joystick_drivers:${SLOT}
	sci-ros/laser_drivers:${SLOT}
	sci-ros/laser_pipeline:${SLOT}
	sci-ros/physics_ode:${SLOT}
	sci-ros/visualization_common:${SLOT}
	sci-ros/navigation:${SLOT}
	sci-ros/robot_model:${SLOT}
	sci-ros/simulator_stage:${SLOT}
	sci-ros/simulator_gazebo:${SLOT}
	sci-ros/slam_gmapping:${SLOT}
	sci-ros/sound_drivers:${SLOT}
	sci-ros/visualization:${SLOT}
	sci-ros/simulator_gazebo:${SLOT}"
RDEPEND="${DEPEND}"
