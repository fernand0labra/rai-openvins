#!/bin/bash

# http://wiki.ros.org/rviz/Tutorials/Interactive%20Markers%3A%20Getting%20Started

# visualization_msgs/InteractiveMarker
# Contains a context menu and several controls
#
# visualization_msgs/InteractiveMarkerControl
# The controls define the different visual parts of the interactive marker
#
# visualization_msgs/InteractiveMarkerFeedback
# changes performed on the interactive markers

rosrun rviz rviz &

# .cpp https://github.com/ros-visualization/visualization_tutorials/blob/indigo-devel/interactive_marker_tutorials/src/basic_controls.cpp
# .py  https://github.com/ros-visualization/visualization_tutorials/blob/indigo-devel/interactive_marker_tutorials/scripts/basic_controls.py
rosrun interactive_marker_tutorials basic_controls

# .cpp https://github.com/ros-visualization/visualization_tutorials/blob/indigo-devel/interactive_marker_tutorials/src/simple_marker.cpp
# .py  https://github.com/ros-visualization/visualization_tutorials/blob/indigo-devel/interactive_marker_tutorials/scripts/simple_marker.py
rosrun interactive_marker_tutorials simple_marker

# .cpp https://github.com/ros-visualization/visualization_tutorials/blob/indigo-devel/interactive_marker_tutorials/src/menu.cpp
# .py  https://github.com/ros-visualization/visualization_tutorials/blob/indigo-devel/interactive_marker_tutorials/scripts/menu.py
rosrun interactive_marker_tutorials menu

# .cpp https://github.com/ros-visualization/visualization_tutorials/blob/indigo-devel/interactive_marker_tutorials/src/pong.cpp
rosrun interactive_marker_tutorials pong

# .cpp https://github.com/ros-visualization/visualization_tutorials/blob/indigo-devel/interactive_marker_tutorials/src/cube.cpp
# .py  https://github.com/ros-visualization/visualization_tutorials/blob/indigo-devel/interactive_marker_tutorials/scripts/cube.py
rosrun interactive_marker_tutorials cube