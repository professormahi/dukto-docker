# Dukto container
Runs a [duktoR6](https://www.msec.it/blog/dukto/) instance and it is possible to redirect it to the host network and its X.

## To Run
```bash
docker run --rm -it \
    -e USER=$USER -e USERID=$UID \          # Setting up the user for received files ownership
    -v /tmp/.X11-unix:/tmp/.X11-unix \      # Redirecting the X11 temporary files
    -e DISPLAY=unix$DISPLAY \               # Setting up the X11 display
    --device /dev/dri \                     # Using the Direct Rendering Infrastructure of host device
    -v $HOME/Downloads/.dukto \             # Setting up the Download folder
    --network host \                        # Connecting to the host network
    --name dukto \
    professormahi/dukto:r6
```
or you can alias the above command:
```bash
alias dukto-docker='docker run --rm -it -e USER=$USER -e USERID=$UID -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --device /dev/dri -v $HOME/Downloads/.dukto --network host --name dukto professormahi/dukto:r6
'
```

## Possible Problems
In a case you've got the following error:
> dukto: cannot connect to X server unix:0
You can simply fix this using the `xhost +` command. This command will allow the docker container to use your host X.