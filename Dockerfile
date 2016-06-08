# freeling

FROM debian:jessie
MAINTAINER Hernán 'herchu' Foffani <hfoffani@gmail.com>
RUN apt-get update && apt-get install -y \
    libboost-regex-dev \
    libicu-dev \
    zlib1g-dev \
    libboost-system-dev \
    libboost-program-options-dev \
    libboost-thread-dev \
    libboost-filesystem-dev
ADD https://github.com/TALP-UPC/FreeLing/releases/download/4.0/freeling-4.0-jessie-amd64.deb freeling-4.0.deb
RUN dpkg -i freeling-4.0.deb \
    && rm freeling-4.0.deb
