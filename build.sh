#!/bin/bash
# build each chapter, convert each chapter to pdf
# build the book in all formats
rm -rf output
bookly build -e
bookly build -a
bookly build -r
