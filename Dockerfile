FROM osrf/ros:noetic-desktop-full-focal

RUN apt-get update && apt-get -y upgrade

# we want git to pull obviously
RUN apt-get install -y git

## install dependencies for obviously
#packages for obcore
RUN apt-get install -y \
gsl-bin \
libgsl-dev \
libudev-dev \
libxml++2.6-dev \
liblua5.1-0-dev \
libeigen3-dev

#packages for obdevice
RUN apt-get install -y \
libopenni-dev \
libv4l-dev

#packages for obgraphic
RUN apt-get install -y \
libvtk6-dev \
libvtk6-qt-dev \
freeglut3-dev

#packages for obvision
RUN apt-get install -y \
libann-dev \
libflann-dev \
liblz4-dev

# set display env
ENV DISPLAY :0

# build obviously
RUN cd ~ && git clone --depth=1 "https://github.com/sven-herrmann/obviously.git"
ENV OBVIOUSLY_ROOT=~/obviously
RUN echo "export OBVIOUSLY_ROOT=~/obviously" >> ~/.bashrc
RUN cd ~/obviously/build/release && cmake . && make

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
# create ROS workspace will later mount packages to build below src
RUN mkdir -p ~/ROS/src
WORKDIR /root/ROS
