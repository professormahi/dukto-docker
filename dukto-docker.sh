#! /bin/bash

xhost +
docker run --rm -d --user $UID:$GID -e USER=$USER -e USERID=$UID -e HOME=$HOME -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/dri -v $HOME:/home/$USER/ -v /etc/passwd:/etc/passwd --network host --name dukto dukto
