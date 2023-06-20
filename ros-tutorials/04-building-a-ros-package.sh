#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/BuildingPackages

source /opt/ros/noetic/setup.bash  # Source environment

# Combination of cmake and make in standard CMake workflow
# catkin_make [make_targets] [-DCMAKE_VARIABLES=...]
# catkin_make --source my_src

cd ./catkin_ws/
ls src;
echo -- beginner_tutorials/ CMakeLists.txt; echo

catkin_make
