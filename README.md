

Docker Image at the Hub
------------

Fetch the public image with

    docker pull herchu/freeling4-es


Test it with

    echo "Mi casa es bonita." | docker run -i herchu/freeling4-es:pub /usr/bin/analyze -f es.cfg



Freeling Docker Image
---------------


Besides docker the procedures depends on
- m4 (probably it's already installed)
- docker-squash
- tar GNU compatible

Squashing the image requires your local root password.


The underline OS of this image is Debian jessy 64.
If you want to build your image by yourself use:

    make build-es
    make squash-es



Debian Package
--------------

The Freeling Debian packages is:

    https://github.com/TALP-UPC/FreeLing/releases/download/4.0/freeling-4.0-jessie-amd64.deb



