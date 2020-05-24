#! /bin/bash

if [ "$(docker ps -q -f name=dukto)" ]; then
    docker exec -d dukto dukto
    exit
fi

xhost +
docker run --rm -d \
    --user $UID:$GID -e USER=$USER -e USERID=$UID \
    -e HOME=$HOME \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    --device /dev/dri \
    -v $HOME:/home/$USER/ \
    -v /etc/passwd:/etc/passwd \
    -e DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" \
    -v /run/user/$UID/bus:/run/user/$UID/bus \
    --network host \
    --name dukto \
    professormahi/dukto:r6
