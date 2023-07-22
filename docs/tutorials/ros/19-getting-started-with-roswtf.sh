#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/Getting%20started%20with%20roswtf

roscd rosmaster
roswtf  # Examine the system to try and find problems

# roswtf will warn you about things that look suspicious but may be normal in your system. 
# It can also report errors for problems that it knows are wrong. 

# If you find yourself stumped by a build or communication issue, try running it and 
# seeing if it can point you in the right direction. 