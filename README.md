

Freeling Docker Image
---------------


Besides docker the procedures depends on
- m4 (probably it's already installed)
- docker-squash
- tar GNU compatible

Squashing the image requires your local root password.


The underline OS of this image is Debian jessy 64

    make squash-es

    echo "Mi casa es bonita." | docker run -i herchu/freeling4-es:pub /usr/bin/analyze -f es.cfg



Debian Package
--------------

The Freeling Debian packages is:

    https://github.com/TALP-UPC/FreeLing/releases/download/4.0/freeling-4.0-jessie-amd64.deb


To Do
-----

Publish

