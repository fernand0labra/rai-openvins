#!/bin/bash

# https://gazebosim.org/docs/citadel/sensors
# https://youtu.be/WcFyGPEfhHc

ign gazebo gazebo_ws/sensor/sensor_tutorial.sdf

# The inertial measurement unit (IMU) outputs the orientation of our robot in quaternions, the 
# angular_velocity in the three axes (X, Y, Z), and the linear_acceleration in the three axes. 
#
#    <always_on> if true the sensor will always be updated according to the update rate.
#    <update_rate> the frequency at which the sensor data is generated.
#    <visualize> if true the sensor is visualized in the GUI.
#    <topic> name of the topic on which data is published.

ign topic -e -t /imu

# The contact sensor gives indications when it touches (contacts) something else
#
# The 'TouchPlugin' will publish (send) a message when the wall has been touched. 
# The tags of the plugin are as follows:
#
#    <target> which will be in contact with our wall, in our case vehicle_blue.
#    <namespace> takes the namespace of our topic, so when our robot hits the wall it will 
#                send a message to /wall/touched topic.

ign topic -e -t /wall/touched

# Lidar is an acronym for "light detection and ranging". This sensor can help us detect obstacles around the robot. 
# We will use it to measure the distance between our robot and the wall.
#
#    Under the <horizontal> and <vertical> tags we define the properties of the horizontal and vertical laser rays
#    <samples> is the number of simulated lidar rays to generate per complete laser sweep cycle
#
# message LaserScan
# {
#   Header header              = 1;
#
#   string frame               = 2;
#   Pose world_pose            = 3;
#   double angle_min           = 4;
#   double angle_max           = 5;
#   double angle_step          = 6;
#   double range_min           = 7;
#   double range_max           = 8;
#   uint32 count               = 9;
#   double vertical_angle_min  = 10;
#   double vertical_angle_max  = 11;
#   double vertical_angle_step = 12;
#   uint32 vertical_count      = 13;
#
#   repeated double ranges              = 14;
#   repeated double intensities         = 15;
# }

ign topic -e -t /lidar

# Compiler publisher/subscriber code
cd gazebo_ws/sensor/build
cmake ../src; make lidar_node; cd ..

ign launch sensor_launch.ign # Launch several executable commands files