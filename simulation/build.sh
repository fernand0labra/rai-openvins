#!/bin/bash

cat ./Dockerfile.noetic-ros-core-focal | docker build -t noetic-ros-core-focal -

cat ./Dockerfile.noetic-ros-base-focal | docker build -t noetic-ros-base-focal -

cat ./Dockerfile.gzserver11-focal | docker build -t gzserver11-focal -

cat ./Dockerfile.libgazebo11-focal | docker build -t ubuntu-focal-ros-noetic-gz11 -