#!/bin/bash

source ./devel/setup.bash
roscd beginner_tutorials
mkdir msg
echo "int64 num" > msg/Num.msg

# package.xml
#
# <build_depend>message_generation</build_depend>
# <exec_depend>message_runtime</exec_depend>


# CMakeLists.txt
#
# >> Compilation
# find_package(catkin REQUIRED COMPONENTS
#   roscpp
#   rospy
#   std_msgs
#   message_generation
# )
#
# >> Runtime
# catkin_package(
#   ...
#   CATKIN_DEPENDS message_runtime ...
#   ...)
#
# >> Project reconfiguration
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )
#
# >> Compilation
# generate_messages(
#   DEPENDENCIES
#   std_msgs
# )


# rosmsg show [message type]
rosmsg show beginner_tutorials/Num  # Show message type contents
rosmsg show Num  # Without package

roscd beginner_tutorials
mkdir srv

# roscp [package_name] [file_to_copy_path] [copy_path]
roscp rospy_tutorials AddTwoInts.srv srv/AddTwoInts.srv  # Copy a .srv file

# >> Project reconfiguration
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )


# rossrv show <service type>
rossrv show beginner_tutorials/AddTwoInts # Show message type contents
rossrv show AddTwoInts  # Without package