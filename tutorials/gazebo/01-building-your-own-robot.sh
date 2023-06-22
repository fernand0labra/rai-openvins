#!/bin/bash

# https://gazebosim.org/docs/citadel/building_robot
# https://youtu.be/Z-gjU0KAjiw

ign gazebo gazebo_ws/building_robot.sdf

## <pose>
# The <pose> tag is used to define the position and orientation of our model and the 
# relative_to attribute is used to define the pose of the model relative to any other frame.

## <link>
# Every model is a group of links (can be just one link) connected together with joints

## <visual>
# The <visual> tag is responsible for how our link will look. We define the shape of our link 
# inside the <geometry> tag and then specify the three dimensions (in meters) of this box inside 
# the <size> tag

## <frame>
# One of the new features of SDF 1.7 is that we can define arbitrary frames. 
# It takes two attributes:
#   name: the name of the frame
#   attached_to: the name of the frame or the link to which this frame is attached.

## <joint>
# The joint tag connects two links together and defines how they will move with respect to each 
# other. Inside the <joint> tag we need to define the two links to connect and their relations 
# (way of movement).