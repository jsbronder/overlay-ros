#!/bin/bash

export ROS_ROOT=/opt/ros/@ROS_DIST@/ros
export ROS_PACKAGE_PATH=/opt/ros/@ROS_DIST@/stacks

if [ -z "${ROS_MASTER_URI}" ]; then
    export ROS_MASTER_URI=http://localhost:11311
fi

if [ -n "${PATH/${ROS_ROOT}\/bin:*/}" ]; then
    export PATH=${ROS_ROOT}/bin:${PATH}
fi

if [ -z "${PYTHONPATH}" -o -n "${PYTHONPATH/${ROS_ROOT}\/core\/roslib\/src:*/}" ]; then
    export PYTHONPATH=${ROS_ROOT}/core/roslib/src:${PYTHONPATH}
fi

if [ ${ROS_PROMPT:-1} -ne 0 ]; then
    export PS1="\[\033[00;33m\][ros]\[\033[00m\] ${PS1}"
    export ROS_PROMPT=0
fi

source ${ROS_ROOT}/tools/rosbash/rosbash
