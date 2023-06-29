FROM osrf/ros:noetic-desktop-full

# install packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -q -y --no-install-recommends \
 ros-noetic-rviz \
 ros-noetic-gazebo-plugins \
 ros-noetic-octomap-msgs \
 ros-noetic-octomap \
 ros-noetic-rqt-gui \
 ros-noetic-rqt-gui-py

RUN apt-get install -q -y --no-install-recommends \
 ros-noetic-joy \
 ros-noetic-octomap-ros \
 ros-noetic-mavlink \
 python3-wstool \
 python3-catkin-tools \
 protobuf-compiler \
 libgoogle-glog-dev \
 ros-noetic-control-toolbox \
 ros-noetic-mavros

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
RUN wget http://packages.ros.org/ros.key -O - | sudo apt-key add -

RUN /bin/bash -c '. /opt/ros/noetic/setup.bash;'

RUN cd / && git clone https://github.com/fernand0labra/ros-openvins-calibration
RUN cd ros-openvins-calibration && mkdir packages && cd packages && mkdir src

RUN cd /ros-openvins-calibration/packages/src && git clone https://github.com/ethz-asl/rotors_simulator
RUN cd /ros-openvins-calibration/packages/src && git clone https://github.com/ethz-asl/mav_comm

RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; \
 cd /ros-openvins-calibration/packages/src; \
 catkin_init_workspace; \
 cd ..; \
 mkdir build; \
 cd build; \
 cmake --parallel 8 ../src -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel; \
 make --jobs 8;'

# COPY build /ros-openvins-calibration/packages/build
# COPY devel /ros-openvins-calibration/packages/devel