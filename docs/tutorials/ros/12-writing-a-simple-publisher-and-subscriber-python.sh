#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/WritingPublisherSubscriber%28python%29
# https://youtu.be/otGWUZqB9XE

roscd beginner_tutorials
mkdir scripts; cd scripts
wget https://raw.github.com/ros/ros_tutorials/kinetic-devel/rospy_tutorials/001_talker_listener/talker.py
chmod u+x talker.py

roscd beginner_tutorials/scripts/
wget https://raw.github.com/ros/ros_tutorials/kinetic-devel/rospy_tutorials/001_talker_listener/listener.py
chmod u+x listener.py

# catkin_install_python(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

cd ./catkin_ws
catkin_make