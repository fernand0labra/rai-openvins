#!/bin/bash

sudo apt-get update
sudo apt-get install wget git

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

##############################################################

# world_name = [basic, empty, hosue, iris, outdoor, test_city]

source ./devel/setup.bash # term 1

roslaunch rotors_gazebo mav_hovering_example_with_vi_sensor.launch mav_name:=firefly world_name:=outdoor
rosrun simulation rotors_simulator.py 
rviz

rosbag record -O rotors_simulator /firefly/vi_sensor/left/image_raw /firefly/vi_sensor/right/image_raw /firefly/vi_sensor/imu /firefly/base_link
rosbag play rotors_simulator