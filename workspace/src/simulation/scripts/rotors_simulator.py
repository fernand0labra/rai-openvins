#!/usr/bin/env python

import rospy
import math
from geometry_msgs.msg import PoseStamped

def generate_circle_points(radius, n):
    points = []
    for i in range(n):
        angle = 2 * math.pi * i / n  # Calculate the angle for the current point
        x = radius * math.cos(angle)  # Calculate the x-coordinate
        y = radius * math.sin(angle)  # Calculate the y-coordinate
        points.append((x, y))  # Add the point to the list
    return points

def pose_commander():
    pub = rospy.Publisher('/firefly/command/pose', PoseStamped, queue_size=10)
    rospy.init_node('pose_commander', anonymous=True)

    pose = PoseStamped()
    pose.header.frame_id = "/base_link"
    pose.header.stamp = rospy.Time.now()

    num_points = 2000
    radius = 5
    
    points = generate_circle_points(radius, num_points)

    pose.pose.position.x = 5.0
    pose.pose.position.y = 0.0
    pose.pose.position.z = 2.0  # Height
    pub.publish(pose)
    rospy.loginfo(pose)
    rospy.sleep(5)

    for (x, y) in points:
        pose.pose.position.x = x
        pose.pose.position.y = y
        pose.pose.position.z = 2.0

        pub.publish(pose)
        rospy.loginfo(pose)
        rospy.sleep(0.01)

if __name__ == '__main__':
    try:
        pose_commander()
    except rospy.ROSInterruptException:
        pass
