#!/bin/bash

# https://gazebosim.org/docs/citadel/moving_robot
# https://youtu.be/oHtQYPDGk3Y

## <plugin>
# The <plugin> tag has two attributes, filename which takes the library file name and 
# name which takes the name of the plugin.
#
# <plugin
#     filename="libignition-gazebo-diff-drive-system.so"
#     name="ignition::gazebo::systems::DiffDrive">
#     <left_joint>left_wheel_joint</left_joint>
#     <right_joint>right_wheel_joint</right_joint>
#     <wheel_separation>1.2</wheel_separation>
#     <wheel_radius>0.4</wheel_radius>
#     <odom_publish_frequency>1</odom_publish_frequency>
#     <topic>cmd_vel</topic>
# </plugin>
#
# This plugin allows the robot to move in any direction given the position and angle to which move
#
# In the <left_joint> and <right_joint> tags we define the joints which connect the left 
# and the right wheel with the body of the robot
# 
# <wheel_radius> takes the radius of the wheel which was defined in the <radius> tag under the wheel link.
#
# odom_publish_frequency> sets the frequency at which the odometry is published
#
# cmd_vel is the input <topic> to the DiffDrive plugin


ign gazebo ign gazebo gazebo_ws/building_robot.sdf  # Launch the robot world

# ign topic -t [topic] -m [messageType] -p [messageContent]
ign topic -t "/cmd_vel" -m ignition.msgs.Twist -p "linear: {x: 0.5}, angular: {z: 0.05}"

ign topic -e -t /keyboard/keypress  # Display all messages sent on /keyboard/keypress topic