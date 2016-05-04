#!/bin/bash
rm -rf course-content
mkdir course-content
cp -r output course-content/book
rm -rf course-content/book/{pdf,html,manuscript,mdx}
cp -r manuscript course-content/manuscript
# copy code
mkdir -p course-content/code
rsync -av --progress code/ ./course-content/code --exclude node_modules
rm -rf course-content/code/.git
# creating archive
TODAY=$(date '+%a-%h-%d-%Y_%H-%M-%S')
# rm -rf "v-${TODAY}"

# remove the formats not necessary for the end-reader
rm -rf course-content/book/{*.docx,*.web.pdf,*.tex}
rm -rf course-content/manuscript

ZIPNAME="${TODAY}-course-content.tar.gz"
tar -zcvf "${ZIPNAME}" course-content
mv $ZIPNAME ~/Desktop
