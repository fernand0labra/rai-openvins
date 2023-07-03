#!/usr/bin/env python

import sys
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

    rospy.sleep(5)

    pose = PoseStamped()
    pose.header.frame_id = "/firefly/base_link"

    radius = 2
    num_points_meter = 50
    num_points_circle = round(num_points_meter * 2 * math.pi * radius)  # 100 points each meter
    sleep_time = 0.01

    height = 5.0 if sys.argv[1] == "zy" else  2.0

    # IMU Excitation
    # for _ in range(3 * num_points_meter):
    pose.header.stamp = rospy.Time.now()
    pose.pose.position.x = 5.0
    pose.pose.position.y = 0.0
    pose.pose.position.z = height

    pub.publish(pose)
    rospy.loginfo(pose)
    rospy.sleep(sleep_time)

    points = generate_circle_points(radius, num_points_circle)

    # Circle Pattern
    for (x, y) in points:
        pose.header.stamp = rospy.Time.now()
        pub.publish(circle_z_y(pose, x, y) if sys.argv[1] == "zy" else circle_x_y(pose, x, y))
        rospy.loginfo(pose)
        rospy.sleep(sleep_time)

    # Back to initial position
    for z in np.linspace(height, 0.0, round(height) * num_points_meter):
        pose.header.stamp = rospy.Time.now()
        pose.pose.position.x = 5.0
        pose.pose.position.y = 0.0
        pose.pose.position.z = z

        pub.publish(pose)
        rospy.loginfo(pose)
        rospy.sleep(sleep_time)

if __name__ == '__main__':
    try:
        pose_commander()
    except rospy.ROSInterruptException:
        pass
