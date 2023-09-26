FROM ubuntu:jammy

RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:mattrose/terminator && \
    apt-get -y update && \
    apt install -y terminator
