#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/CreatingPackage
# https://youtu.be/mwLsIhxUxQc

# workspace_folder/        -- WORKSPACE
#  src/                   -- SOURCE SPACE
#    CMakeLists.txt       -- 'Toplevel' CMake file, provided by catkin
#    package_1/
#      CMakeLists.txt     -- CMakeLists.txt file for package_1
#      package.xml        -- Package manifest for package_1
#    ...
#    package_n/
#      CMakeLists.txt     -- CMakeLists.txt file for package_n
#      package.xml        -- Package manifest for package_n


cd ./catkin_ws/src

# catkin_create_pkg <package_name> [depend1] [depend2] [depend3]
catkin_create_pkg beginner_tutorials std_msgs rospy roscpp  # Create package 'beginner_tutorials'

source ./devel/setup.bash

rospack depends1 beginner_tutorials; echo  # See first-order dependencies
roscd beginner_tutorials
cat package.xml; echo

rospack depends beginner_tutorials; echo  # See indirect dependencies
