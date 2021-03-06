# Dukto container
Runs a [duktoR6](https://www.msec.it/blog/dukto/) instance and it is possible to redirect it to the host network and its X.

## How To Run
```bash
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
```
or you can alias the above command:
```bash
alias dukto-docker='docker run --rm -it --user $UID:$GID -e USER=$USER -e USERID=$UID -e HOME=$HOME -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/dri -v $HOME:/home/$USER/ -v /etc/passwd:/etc/passwd -e DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS" -v /run/user/$UID/bus:/run/user/$UID/bus --network host --name dukto professormahi/dukto:r6'
```

## How To Install
To install use `install.sh` script. It will add a desktop files to run the Dukto container

## Possible Problems
In a case you've got the following error:

> dukto: cannot connect to X server unix:0

You can simply fix this using the `xhost +` command. This command will allow the docker container to use your host X.