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

sudo apt-get update
sudo apt-get install wget git
sudo adduser user; usermod -aG sudo user; su user; cd

git clone https://github.com/fernand0labra/ros-openvins-calibration
cd ros-openvins-calibration; mkdir packages; cd packages; mkdir src; cd src;

git clone https://github.com/ethz-asl/rotors_simulator
git clone https://github.com/ethz-asl/mav_comm

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update

sudo apt-get install ros-noetic-rviz ros-noetic-gazebo-plugins ros-noetic-octomap-msgs ros-noetic-octomap ros-noetic-rqt-gui ros-noetic-rqt-gui-py
sudo apt-get install ros-noetic-joy ros-noetic-octomap-ros ros-noetic-mavlink python3-wstool python3-catkin-tools protobuf-compiler libgoogle-glog-dev ros-noetic-control-toolbox ros-noetic-mavros

source /opt/ros/noetic/setup.bash
cd ..; catkin_make
source ../../packages/devel/setup.bash # term 1

git clone https://github.com/devbharat/python-uinput; cd python-uinput
python setup.py build
sudo python setup.py install

modprobe -i uinput
cd udev-rules
sudo cp 40-uinput.rules /etc/udev/rules.d

pip install -U pygame==2.4.0 --user

sudo addgroup uinput
sudo adduser $USER uinput

# world_name = [basic, empty, hosue, iris, outdoor, test_city]
roslaunch rotors_gazebo mav_hovering_example.launch mav_name:=firefly world_name:=basic
roslaunch rotors_gazebo mav_with_keyboard.launch
roslaunch ./rotor_simulator.launch mav_name:=firefly world_name:=empty
