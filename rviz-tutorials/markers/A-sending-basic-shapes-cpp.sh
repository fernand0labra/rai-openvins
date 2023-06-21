#!/bin/bash

# http://wiki.ros.org/rviz/Tutorials/Markers%3A%20Basic%20Shapes

catkin_create_pkg using_markers roscpp visualization_msgs

cd ./catkin_ws; catkin_make
. ./devel/setup.bash

rosmake rviz
rosrun using_markers basic_shapes
rosrun rviz rviz