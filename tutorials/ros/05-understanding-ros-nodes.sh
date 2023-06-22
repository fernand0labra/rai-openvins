#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/UnderstandingNodes
# https://youtu.be/rIPmFy_Ax2A

roscore &  # master (provides name service for ROS) + rosout (stdout/stderr) + parameter server

# started roslaunch server http://machine_name:33919/
# ros_comm version 1.4.7

# SUMMARY
# ======

# PARAMETERS
#  * /rosversion
#  * /rosdistro

# NODES

# auto-starting new master
# process[master]: started with pid [13054]
# ROS_MASTER_URI=http://machine_name:11311/

# setting /run_id to 9cf88ce4-b14d-11df-8a75-00251148e8cf
# process[rosout-1]: started with pid [13067]
# started core service [/rosout]


rosnode list  # Information about ROS nodes that are currently running
echo -- /rosout; echo

rosnode info /rosout  # Information about a specific node

# ------------------------------------------------------------------------
# Node [/rosout]
# Publications:
#  * /rosout_agg [rosgraph_msgs/Log]

# Subscriptions:
#  * /rosout [unknown type]

# Services:
#  * /rosout/get_loggers
#  * /rosout/set_logger_level

# contacting node http://machine_name:54614/ ...
# Pid: 5092


# rosrun [package_name] [node_name]
rosrun turtlesim turtlesim_node &  # Runs a node from a given package

rosnode list
echo -- /rosout; echo -- /turtlesim; echo

# Remapping argument to change the node's name
rosrun turtlesim turtlesim_node __name:=my_turtle &

rosnode list
echo -- /my_turtle; echo -- /rosout; echo

rosnode ping my_turtle  # Test node connection
