#!/bin/bash
./build.sh --pdf
./lean.sh
./udy.sh
git add --all
git commit -m 'build'
git push origin master
