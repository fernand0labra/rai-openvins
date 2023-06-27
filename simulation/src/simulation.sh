#!/bin/bash

##############################################
#                  OpenVINS                  #
##############################################

# https://docs.openvins.com/gs-tutorial.html

roscore # term 0
source ../../packages/devel/setup.bash # term 1
roslaunch ./ov_msckf.launch config:=euroc_mav
roslaunch ov_msckf subscribe.launch config:=euroc_mav

rviz # term 2 (ov_msckf/launch/display.rviz)
rosbag play ../data/V1_01_easy.bag # term 3


##############################################
#                  xVIO ROS                  #
##############################################

# https://github.com/jpl-x/x/wiki/xVIO-ROS#run-xvio-on-the-example-dataset
# https://github.com/jpl-x/x/wiki/gui-description

source ../../packages/devel/setup.bash # term 1
roslaunch x_vio_ros vio.launch
roscd x_vio_ros/scripts/; ./load_gui.sh  # -> Initialize Filter
rosbag play ../data/circle_high_vel_restamped.bag --clock


##############################################
#              Rotors Simulator              #
##############################################

source ../../packages/devel/setup.bash # term 1

git clone https://github.com/devbharat/python-uinput; cd python-uinput
python setup.py build
sudo python setup.py install

modprobe -i uinput
cd udev-rules
sudo cp 40-uinput.rules /etc/udev/rules.d

pip install -U pygame==2.4.0 --user
sudo apt-get install ros-noetic-joy

sudo addgroup uinput
sudo adduser $USER uinput

# world_name = [basic, empty, hosue, iris, outdoor, test_city]
roslaunch rotors_gazebo mav_with_keyboard.launch
roslaunch ./rotor_simulator.launch mav_name:=firefly world_name:=empty
