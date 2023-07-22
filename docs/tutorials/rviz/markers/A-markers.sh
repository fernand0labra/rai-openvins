#!/bin/bash

# http://wiki.ros.org/rviz/Tutorials/Markers%3A%20Basic%20Shapes
# http://wiki.ros.org/rviz/Tutorials/Markers%3A%20Points%20and%20Lines

catkin_create_pkg using_markers roscpp visualization_msgs

cd ./catkin_ws; catkin_make
. ./devel/setup.bash

rosmake rviz
rosrun using_markers basic_shapes
rosrun rviz rviz

# The POINTS type places a point at each point added. 
# The LINE_STRIP type uses each point as a vertex in a connected set of lines, where point 0 is connected to point 1, 1 to 2, 2 to 3, etc. 
# The LINE_LIST type creates unconnected lines out of each pair of points

. ./devel/setup.bash

rosrun rviz rviz &
rosrun using_markers points_and_lines