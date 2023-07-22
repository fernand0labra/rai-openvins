#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/WritingServiceClient%28python%29
# https://youtu.be/dxVQnWhDgfg

chmod u+x scripts/add_two_ints_server.py
chmod u+x scripts/add_two_ints_client.py

# catkin_install_python(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

cd ./catkin_ws
catkin_make