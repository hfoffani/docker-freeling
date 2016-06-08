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
ADD https://github.com/TALP-UPC/FreeLing/releases/download/4.0/freeling-4.0-jessie-amd64.deb freeling-4.0.deb
RUN dpkg -i freeling-4.0.deb \
    && rm freeling-4.0.deb
# Configure timezone and locale
#RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
#   echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
#   dpkg-reconfigure --frontend=noninteractive locales && \
#   update-locale LANG=en_US.UTF-8
#
#RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale-gen && \
#    locale-gen && \
#    locale-gen en_US.UTF-8 && \
#    dpkg-reconfigure --frontend=noninteractive locales
#
#ENV LANGUAGE en_US.UTF-8
#ENV LANG en_US.UTF-8
#ENV LC_ALL en_US.UTF-8
#ENV LC_CTYPE en_US.UTF-8

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN dpkg-reconfigure --frontend=noninteractive locales
RUN locale-gen en_US.UTF-8
RUN /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
