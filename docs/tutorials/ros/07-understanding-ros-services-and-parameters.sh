#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/UnderstandingServicesParams
# https://youtu.be/zQL0pEVZDKQ

# rosservice can easily attach to ROS's client/service framework with services

rosservice list  # Print information about active services

# /clear
# /kill
# /reset
# /rosout/get_loggers
# /rosout/set_logger_level
# /spawn
# /teleop_turtle/get_loggers
# /teleop_turtle/set_logger_level
# /turtle1/set_pen
# /turtle1/teleport_absolute
# /turtle1/teleport_relative
# /turtlesim/get_loggers
# /turtlesim/set_logger_level


rosservice type /clear  # Print service type
echo -- std_srvs/Empty; echo  # When the service call is made it takes no arguments

# rosservice call [service] [args]
rosservice call /clear  # Call the service with the provided args

rosservice type /spawn | rossrv show  # Show request/response arguments for service

# float32 x
# float32 y
# float32 theta
# string name
# ---
# string name


rosservice call /spawn 2 2 0.2 ""

rosservice type /spawn  # Find services by service type
rosservice uri /spawn  # Print service ROSRPC uri

# rosparam allows you to store and manipulate data on the ROS Parameter Server

rosparam list  # List parameter names

# /rosdistro
# /roslaunch/uris/host_nxt__43407
# /rosversion
# /run_id
# /turtlesim/background_b
# /turtlesim/background_g
# /turtlesim/background_r


# rosparam set [param_name]
rosparam set /turtlesim/background_r 150  # Set parameter

rosservice call /clear

# rosparam get [param_name]
rosparam get /turtlesim/background_g  # Get parameter

rosparam get /  # Show contents of the Parameter Server

# rosdistro: 'noetic'
# roslaunch:
#   uris:
#     host_ubuntu__36819: http://ubuntu:36819/
# rosversion: '1.16.0'
# run_id: 5a8642c8-0e9d-11ee-9951-f13801378d4b
# turtlesim:
#   background_b: 255
#   background_g: 86
#   background_r: 150


# rosparam dump [file_name] [namespace]
rosparam dump params.yaml  # Dump parameters to file

# rosparam load [file_name] [namespace]
rosparam load params.yaml copy_turtle  # Load parameters from file
rosparam get /copy_turtle/turtlesim/background_b