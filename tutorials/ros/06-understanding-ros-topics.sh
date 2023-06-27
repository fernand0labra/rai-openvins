#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/UnderstandingTopics
# https://youtu.be/rIPmFy_Ax2A

roscore &

rosrun turtlesim turtlesim_node &

rosrun turtlesim turtlesim_teleop_key &

# turtle_teleop_key is publishing the key strokes on a topic, while turtlesim subscribes
# to the same topic to receive the key strokes.

sudo apt-get install ros-noetic-rqt
sudo apt-get install ros-noetic-rqt-common-plugins

rosrun rqt_graph rqt_graph  # Creates a dynamic graph of what is going on in the system

# rostopic echo [topic]
rostopic echo /turtle1/cmd_vel  # Show the data published on a topic
rosrun rqt_graph rqt_graph

rostopic list -v  # Return a list of all topics currently subscribed to and published

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


# For the publisher and subscriber to communicate, the publisher and subscriber must send and 
# receive the same type of message.

# rostopic type [topic]
rostopic type /turtle1/cmd_vel  # Return the message type of any topic being published
echo -- geometry_msgs/Twist; echo

rosmsg show geometry_msgs/Twist  # Return the details of the message

# rostopic pub [topic] [msg_type] [args]
# '-1' indicates exit after one message
# '--' indicates that none of the following arguments is an option
# [args] in YAML syntax
#
# Publish data on a topic currently advertised
rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, 1.8]'

# rostopic hz [topic]
rostopic hz /turtle1/pose  # Report the rate at which data is published

# Conjunction of 'rostopic type' and 'rosmsg'
rostopic type /turtle1/cmd_vel | rosmsg show  # Get in depth information about a topic

rosrun rqt_plot rqt_plot  # Display a scrolling time plot of the data published on topics