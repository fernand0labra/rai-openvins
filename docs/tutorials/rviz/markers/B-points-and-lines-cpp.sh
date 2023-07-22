#!/bin/bash

# http://wiki.ros.org/rviz/Tutorials/Markers%3A%20Points%20and%20Lines

# The POINTS type places a point at each point added. 
# The LINE_STRIP type uses each point as a vertex in a connected set of lines, where point 0 is connected to point 1, 1 to 2, 2 to 3, etc. 
# The LINE_LIST type creates unconnected lines out of each pair of points

. ./devel/setup.bash

rosrun rviz rviz &
rosrun using_markers points_and_lines