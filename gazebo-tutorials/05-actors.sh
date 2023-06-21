#!/bin/bash

# https://gazebosim.org/docs/citadel/actors
# https://youtu.be/1VZexw67a2o

# Skeleton animation, which is relative motion between links in one model
# Trajectory animation, which carries all of the actor's links around the world as one group along a trajectory.

ign gazebo gazebo_ws/actor_demo.sdf

## <actor>
# Actors have the following properties:
#
#    No forces are applied on them, be it from gravity or contact or anything else
#    Actors support skeleton animation imported from COLLADA (.dae) and BVH (.bvh) files.
#    Actors can have trajectories scripted directly in SDF.
#
## <skin>
# Specifies how an actor looks. When a COLLADA file is used within the <skin> tags its animation is loaded
#
## <scale>
# Scales teh skin's size
#
## <animation>
# Specify how our actor will move. We can combine different skins with different animations as long as they 
# have compatible skeletons.
#
## <script>
# Scripted trajectory by specifying a series of poses to be reached at specific times
# 
#    loop: Set this to true for the script to be repeated in a loop
#    delay_start: This is the time in seconds to wait before starting the script
#    auto_start: Set to true if the animation should start as soon as the simulation starts playing
#
## <trajectory>
# Define a series of waypoints which our actor will follow
#
## <waypoint>
# There can be any number of waypoints in a trajectory. The order in which waypoints are defined is not 
# important, they will follow the given times.
# 
#    time: The time in seconds when the pose should be reached.
#    pose: The pose which should be reached with respect to the initial actor pose.
