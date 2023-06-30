#!/bin/bash

##############################################
#                  OpenVINS                  #
##############################################

# https://docs.openvins.com/gs-tutorial.html

roscore # term 0
source ./devel/setup.bash # term 1
roslaunch ov_msckf subscribe.launch config:=euroc_mav

rviz # term 2 (ov_msckf/launch/display.rviz)
rosbag play ./src/simulation/data/rotors_simulator.bag \
 /firefly/vi_sensor/left/image_raw:=/cam0/image_raw \
 /firefly/vi_sensor/right/image_raw:=/cam1/image_raw \
 /firefly/vi_sensor/imu:=/imu0 # term 3


##############################################
#                  xVIO ROS                  #
##############################################

# https://github.com/jpl-x/x/wiki/xVIO-ROS#run-xvio-on-the-example-dataset
# https://github.com/jpl-x/x/wiki/gui-description

source ../../packages/devel/setup.bash # term 1
roslaunch x_vio_ros vio.launch
roscd x_vio_ros/scripts/; ./load_gui.sh  # -> Initialize Filter
rosbag play ../data/circle_high_vel_restamped.bag --clock