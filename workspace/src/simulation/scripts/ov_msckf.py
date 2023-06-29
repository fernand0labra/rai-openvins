#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image, Imu

cam0_pub = None
cam1_pub = None
imu_pub = None

def callback_cam0(data):
    cam0_pub.publish(data)

def callback_cam1(data):
    cam1_pub.publish(data)

def callback_imu(data):
    imu_pub.publish(data)

def refactor():
    cam0_pub = rospy.Publisher('/cam0/image_raw', Image, queue_size=10)
    cam1_pub = rospy.Publisher('/cam1/image_raw', Image, queue_size=10)
    imu_pub = rospy.Publisher('/imu0', Imu, queue_size=10)

    rospy.init_node('refactor', anonymous=True)

    rospy.Subscriber('/firefly/vi_sensor/left/image_raw', Image, cam0_pub)
    rospy.Subscriber('/firefly/vi_sensor/right/image_raw', Image, cam1_pub)
    rospy.Subscriber('/firefly/vi_sensor/imu', Imu, imu_pub)

    rospy.spin()

if __name__ == '__main__':
    refactor()
