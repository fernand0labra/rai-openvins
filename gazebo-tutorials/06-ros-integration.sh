#!/bin/bash

# https://gazebosim.org/docs/citadel/ros_integration

# ros_ign_bridge provides a network bridge which enables the exchange of messages between ROS 1 and Ignition Transport
sudo apt install ros-noetic-ros-ign

. /opt/ros/noetic/setup.bash  # Update source file for ROS
roscore  # Run ROS Master

ign gazebo -r camera_sensor.sdf  # Run Gazebo world

ign topic -l | grep "^/camera"  # Search for topic /camera

# Start the parameter bridge with the /camera topic
. /opt/ros/noetic/setup.bash  # Update source file for ROS
rosrun ros_ign_bridge parameter_bridge /camera@sensor_msgs/Image@ignition.msgs.Image

# Start the ROS 1 GUI:
. /opt/ros/noetic/setup.bash  # Update source file for ROS
rqt_image_view /camera