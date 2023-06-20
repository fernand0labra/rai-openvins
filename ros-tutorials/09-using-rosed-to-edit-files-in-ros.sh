#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/UsingRosEd


# Directly edit a file within a package by using the package name rather than having to 
# type the entire path to the package

# rosed [package_name] [filename]
rosed roscpp Logger.msg


# The default editor for rosed is vim
export EDITOR='nano -w'  # Set default editor to 'nano'