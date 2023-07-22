#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/Recording%20and%20playing%20back%20data


roscore &
rosrun turtlesim turtlesim_node &
rosrun turtlesim turtle_teleop_key &

rostopic list -v

# Published topics:
#  * /turtle1/color_sensor [turtlesim/Color] 1 publisher
#  * /turtle1/cmd_vel [geometry_msgs/Twist] 1 publisher
#  * /rosout [rosgraph_msgs/Log] 2 publishers
#  * /rosout_agg [rosgraph_msgs/Log] 1 publisher
#  * /turtle1/pose [turtlesim/Pose] 1 publisher
#
# Subscribed topics:
#  * /turtle1/cmd_vel [geometry_msgs/Twist] 1 subscriber
#  * /rosout [rosgraph_msgs/Log] 1 subscriber

mkdir bagfiles; cd bagfiles
rosbag record -a  # All published topics should be accumulated in a bag file

# rosbag info <your bagfile>

# rosbag play <your bagfile>
# The publishing waiting period can be specified with the -d option. 
# Start some duration past the beginning using the -s argument

# rosbag play -r 2 <your bagfile>
# Change the rate of publishing by a specified factor

rosbag record -O subset /turtle1/cmd_vel /turtle1/pose  # Log to a file named subset.bag
rosbag info subset.bag