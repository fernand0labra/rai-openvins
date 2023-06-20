#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/reading%20msgs%20from%20a%20bag%20file

cd ./bagfiles

time rosbag info subset.bag  
time rosbag info subset.bag | grep -E "(/turtle1/pose|/turtle1/cmd_vel)"

rostopic echo /turtle1/pose | tee topic.yaml

# time rosbag play --immediate bagfile.bag --topics /topic1 /topic2 /topic3 /topicN
# Play back the bag file as quickly as possible, publishing only topics of interest
time rosbag play --immediate subset.bag --topics /turtle1/pose

...