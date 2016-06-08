# freeling

FROM debian:jessie

MAINTAINER Hernán 'herchu' Foffani <hfoffani@gmail.com>

RUN apt-get update -qq && apt-get install -y -qq \
    locales \
    libboost-regex-dev \
    libicu-dev \
    zlib1g-dev \
    libboost-system-dev \
    libboost-program-options-dev \
    libboost-thread-dev \
    libboost-filesystem-dev

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8

# For building test you can use a local .deb package.
ADD https://github.com/TALP-UPC/FreeLing/releases/download/4.0/freeling-4.0-jessie-amd64.deb freeling4.deb
# ADD freeling-4.0-jessie-amd64.deb freeling4.deb

RUN dpkg -i freeling4.deb \
    && rm freeling4.deb
