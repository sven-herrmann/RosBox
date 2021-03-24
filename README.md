# Building the image
Build an Ubuntu 20.04 image with ros and gazebo installed and build the obviously library from source.

```
docker build -t rosbox .
```

# Running an instance

```
docker run -ti --rm --net=host \
-v ${HOME}/.Xauthority:/home/user/.Xauthority \
-v ${SRC_DIR_WITH_ROS_PKGS}:/home/user/ROS/src \
rosbox \
bash
```

# zsh helper

```
export ROSHOME=$HOME/Programming/ROS

export ROS_DOCKER_IMG="rosbox"

rosbox () {
  docker run -ti --rm --net=host \
    -v ${HOME}/.Xauthority:/home/user/.Xauthority \
    -v ${ROSHOME}/src:/home/user/ROS/src \
    ${ROS_DOCKER_IMG} \
    bash
}
```
