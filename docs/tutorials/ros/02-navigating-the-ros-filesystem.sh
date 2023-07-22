#!/bin/bash

# https://wiki.ros.org/ROS/Tutorials/NavigatingTheFilesystem

# Overlay this workspace on top of your environment
source /opt/ros/noetic/setup.bash

# rospack - Information about packages
rospack find roscpp
echo -- YOUR_INSTALL_PATH/share/roscpp; echo

# roscd (rosbash) - Change directory/subdirectory
roscd roscpp
pwd;echo -- YOUR_INSTALL_PATH/share/roscpp; echo

roscd roscpp/cmake
pwd;echo -- YOUR_INSTALL_PATH/share/roscpp/cmake; echo

# roscd log - Log files directory
roscd log; echo

# rosls (rosbash) - Show directory/subdirectory content
rosls roscpp_tutorials
echo -- cmake launch package.xml srv; echo
