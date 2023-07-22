#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/UsingRqtconsoleRoslaunch
# https://youtu.be/0-zTU4_S6vY

sudo apt-get install ros-noetic-rqt ros-noetic-rqt-common-plugins ros-noetic-turtlesim

# Attach to ROS's logging framework to display output from nodes
rosrun rqt_console rqt_console

# Change the verbosity level (DEBUG, WARN, INFO, and ERROR) of nodes as they run
rosrun rqt_logger_level rqt_logger_level

rosrun turtlesim turtlesim_node

# Logging levels are prioritized in the following order
# 1) Fatal - 2) Error - 3) Warn - 4) Info - 5) Debug

# By setting the logger level, you will get all messages of that
# priority level or higher.


cd ./catkin_ws
source devel/setup.bash
roscd beginner_tutorials

mkdir launch; cd launch
# roslaunch [package] [filename.launch]
roslaunch beginner_tutorials turtlemimic.launch

rqt_graph