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
TODAY=$(date '+%a-%h-%d-%Y')
# rm -rf "v-${TODAY}"
ZIPNAME="${TODAY}-course-content.tar.gz"
tar -zcvf "${ZIPNAME}" course-content
mv $ZIPNAME ~/Desktop
