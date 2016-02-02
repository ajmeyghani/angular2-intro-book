#!/bin/bash
# uncomment if need pdf for each section .... .
# ./build.sh --pdf
./build.sh
./lean.sh
./udy.sh
git add --all
git commit -m 'build'
git push origin master
