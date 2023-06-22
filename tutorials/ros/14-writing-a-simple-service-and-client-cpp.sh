#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/WritingServiceClient%28c%2B%2B%29
# https://youtu.be/dxVQnWhDgfg

# A service class contains two members, request and response. 
# It also contains two class definitions, Request and Response. 

# >> CMakeLists.txt
# add_executable(add_two_ints_server src/add_two_ints_server.cpp)
# add_executable(add_two_ints_client src/add_two_ints_client.cpp)
#
# target_link_libraries(add_two_ints_server ${catkin_LIBRARIES})
# target_link_libraries(add_two_ints_client ${catkin_LIBRARIES})
#
# add_dependencies(add_two_ints_server beginner_tutorials_gencpp)
# add_dependencies(add_two_ints_client beginner_tutorials_gencpp)

cd ./catkin_ws
catkin_make