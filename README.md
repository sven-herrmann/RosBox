# Building the image
Build an Ubuntu 20.04 image with ros and gazebo installed and build the obviously library from source.

```
docker build -t rosbox .
```

# Running an instance

```
docker run -ti --rm --net=host \
-v ${HOME}/.Xauthority:/home/user/.Xauthority \
-v ${ROS_BUILD_DIR}:/home/user/ROS \
--device=/dev/dri:/dev/dri \
rosbox \
tmux
```

# zsh helper

```
export ROSHOME=$HOME/Programming/ROS

export ROS_DOCKER_IMG="rosbox"

rosbox () {
  docker run -ti --rm --net=host \
    -v ${HOME}/.Xauthority:/home/user/.Xauthority \
    -v ${ROSHOME}:/home/user/ROS \
    --device=/dev/dri:/dev/dri \
    ${ROS_DOCKER_IMG} \
    tmux
}
```
