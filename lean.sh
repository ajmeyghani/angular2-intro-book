#!/bin/bash
# build the book for leanpub and the folder structure
# that it expects.
rm -rf manuscript
bookly concat
cp -r output/manuscript manuscript
cp book-lean.txt manuscript/book.txt
cp -r images manuscript/images
# mv all the md files to the root of manuscript
mv manuscript/*/*.md ./manuscript/
# clean up
find manuscript -not -name "cha*\.md" -type d -not -name "images" -not -name "manuscript" -delete
