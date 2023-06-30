#!/usr/bin/env python

import math
import rospy
import numpy as np

from geometry_msgs.msg import PoseStamped

def generate_circle_points(radius, n):
    points = []
    for i in range(n):
        angle = 2 * math.pi * i / n  # Calculate the angle for the current point
        x = radius * math.cos(angle)  # Calculate the x-coordinate
        y = radius * math.sin(angle)  # Calculate the y-coordinate
        points.append((x, y))  # Add the point to the list
    return points

def circle_x_y(pose, x, y):
    pose.pose.position.x = x + 3
    pose.pose.position.y = y
    pose.pose.position.z = 2.0

    return pose

def circle_z_y(pose, z, y):
    pose.pose.position.x = 5.0
    pose.pose.position.y = y
    pose.pose.position.z = z + 3

    return pose

def pose_commander():
    pub = rospy.Publisher('/firefly/command/pose', PoseStamped, queue_size=10)
    rospy.init_node('pose_commander', anonymous=True)

    pose = PoseStamped()
    pose.header.frame_id = "/base_link"
    pose.header.stamp = rospy.Time.now()

    radius = 2
    num_points = round(50 * 2 * math.pi * radius)  # 50 points each meter

    # IMU Excitation
    for i in range(3 * 40):  # 3 seconds before startup
        pose.pose.position.x = 5.0
        pose.pose.position.y = 0.0
        pose.pose.position.z = 5.0  

        pub.publish(pose)
        rospy.loginfo(pose)
        rospy.sleep(0.025)

    points = generate_circle_points(radius, num_points)

    for (x, y) in points:
        pub.publish(circle_z_y(pose, x, y))
        rospy.loginfo(pose)
        rospy.sleep(0.025)

if __name__ == '__main__':
    try:
        pose_commander()
    except rospy.ROSInterruptException:
        pass
