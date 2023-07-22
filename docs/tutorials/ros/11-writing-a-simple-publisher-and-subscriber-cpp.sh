#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/WritingPublisherSubscriber%28c%2B%2B%29
# https://youtu.be/8bUkLNEu5Ns

roscd beginner_tutorials
wget https://raw.github.com/ros/ros_tutorials/kinetic-devel/roscpp_tutorials/talker/talker.cpp

roscd beginner_tutorials/scripts/
wget https://raw.github.com/ros/ros_tutorials/kinetic-devel/roscpp_tutorials/listener/listener.cpp

# >> CMakeLists.txt
# add_executable(talker src/talker.cpp)
# add_executable(listener src/listener.cpp)
#
# target_link_libraries(talker ${catkin_LIBRARIES})
# target_link_libraries(listener ${catkin_LIBRARIES})
#
# add_dependencies(talker beginner_tutorials_generate_messages_cpp)
# add_dependencies(listener beginner_tutorials_generate_messages_cpp)

cd ./catkin_ws
catkin_make