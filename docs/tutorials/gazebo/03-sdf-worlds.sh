#!/bin/bash

# https://gazebosim.org/docs/citadel/sdf_worlds
# https://youtu.be/48TX-XJ14Gs

ign gazebo gazebo_ws/world_demo.sdf

## <physics>
# The physics tag specifies the type and properties of the dynamic engine

## <plugin>
# Plugins are a dynamically loaded chunk of code
#
# The 'Physics' plugin is very important for simulating the dynamics of the world
# The 'UserCommands' plugin is responsible for creating models, moving models, deleting them and many other user commands
# 'SceneBroadcaster' shows our world scene

## <gui>
# The 'GzScene3D' plugin is responsible for displaying the 3D scene of our world. It has the following properties:
#    showTitleBar if true it will show the blue title bar over the plugin with the name mentioned in the <title> tag.
#    state is the state of the plugin it can be docked in its place using docked or it can be floating.
#
# The 'WorldControl' plugin is responsible for controlling the world. Some of its properties are the following:
#    <play_pause> if true we will have the play-pause button on the bottom left corner.
#    <stats_topic> tag specifies the topic at which the world stats like simulation time and real time are published on.
#    <start_paused> if true the simulation will be paused at the start of Ignition.
#
# With the 'Entity tree' plugin we can see all the entities of our world

# The WorldStats plugin is responsible for displaying the world statistics, <sim_time>, <real_time>, <real_time_factor> and <iterations>.
ign topic -e -t /world/world_demo/stats
