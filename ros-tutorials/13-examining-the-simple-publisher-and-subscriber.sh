#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/ExaminingPublisherSubscriber
# https://youtu.be/otGWUZqB9XE


source ./devel/setup.bash
roscore

rosrun beginner_tutorials talker      # (C++)
rosrun beginner_tutorials talker.py   # (Python) 

rosrun beginner_tutorials listener    # (C++)
rosrun beginner_tutorials listener.py # (Python) 