#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/ExaminingServiceClient

source ./devel/setup.bash
roscore

rosrun beginner_tutorials add_two_ints_server     # (C++)
rosrun beginner_tutorials add_two_ints_server.py  # (Python) 

rosrun beginner_tutorials add_two_ints_client 1 3     # (C++)
rosrun beginner_tutorials add_two_ints_client.py 1 3  # (Python) 