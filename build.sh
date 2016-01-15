#!/bin/bash
# build each chapter, convert each chapter to pdf
# build the book in all formats
rm -rf output
rm -rf images
# copy all the images to output/images
mkdir -p output/images
mkdir -p images
find -E chapters -regex ".*\.(jpg|gif|png|jpeg)" -exec cp {} ./output/images/ \;
find -E chapters -regex ".*\.(jpg|gif|png|jpeg)" -exec cp {} ./images/ \;
# build
bookly build -e
bookly build -a
# bookly build -r # building with phatnoms
electron-pdf output/ng2-intro.html output/ng2-intro.web.pdf
bash ./electron.sh
