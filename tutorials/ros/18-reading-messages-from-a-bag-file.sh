#!/bin/bash

# http://wiki.ros.org/ROS/Tutorials/reading%20msgs%20from%20a%20bag%20file

cd ./bagfiles

time rosbag info subset.bag  
time rosbag info subset.bag | grep -E "(/turtle1/pose|/turtle1/cmd_vel)"

rostopic echo /turtle1/pose | tee topics.yaml

# time rosbag play --immediate bagfile.bag --topics /topic1 /topic2 /topic3 /topicN
# Play back the bag file as quickly as possible, publishing only topics of interest
time rosbag play --immediate subset.bag --topics /turtle1/pose


#########################################
##          ros_readbagfile            ##
#########################################

mkdir -p ~/bin; cd ~/bin  # Ensure you have the ~/bin directory for personal binaries
wget https://raw.githubusercontent.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles/master/useful_scripts/ros_readbagfile.py
mv ros_readbagfile.py ros_readbagfile
chmod u+x ros_readbagfile

# Re-source your ~/.profile file to ensure ~/bin is in your PATH, so you can use this
# new `ros_readbagfile` command you just installed
. ~/.profile

sudo apt-get install python3-pip
pip3 install bagpy

# Read these topics and print them to stdout
# time ros_readbagfile <mybagfile.bag> [topic1] [topic2] [topic3] [...]
time ros_readbagfile subset.bag /turtle1/pose /turtle1/cmd_vel

# Write to the topics.yaml file withOUT also printing to stdout
# time ros_readbagfile <mybagfile.bag> [topic1] [topic2] [topic3] [...] > topics.yaml
time ros_readbagfile subset.bag /turtle1/pose /turtle1/cmd_vel > topics.yaml

# Write to the topics.yaml file AND print to stdout
# time ros_readbagfile <mybagfile.bag> [topic1] [topic2] [topic3] [...] | tee topics.yaml
time ros_readbagfile subset.bag /turtle1/pose /turtle1/cmd_vel | tee topics.yaml

# https://github.com/BurntSushi/ripgrep#installation
sudo apt update && sudo apt install ripgrep  # Faster grep

# The rg 'linear_velocity' topics.yaml part searches the "topics.yaml" text file for the 'linear_velocity' string
# The sort -V part sorts all of the output lines
# The awk '!seen[$0]++' part removes duplicate entries, so that you only see one line of each match. 
time rg 'linear_velocity' topics.yaml | sort -V | awk '!seen[$0]++'

# Searching for several data entries
time rg '(theta|linear_velocity|angular_velocity)' topics.yaml | sort -V | awk '!seen[$0]++'