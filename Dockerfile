FROM ubuntu:16.04

 
# Install the dukto package
USER root
WORKDIR /tmp/
RUN apt-get update \
    && apt-get install wget libqt4-declarative libqt4-network libqt4-network libqtgui4 -y 

RUN wget http://ftp.lysator.liu.se/pub/opensuse/repositories/home:/colomboem/xUbuntu_16.04/amd64/dukto_6.0-1_amd64.deb \
    && dpkg -i dukto_6.0-1_amd64.deb 

RUN apt-get install -f -y \
    && rm -rf /var/lib/apt/lists/* 


WORKDIR /data
ENTRYPOINT ["dukto"]

