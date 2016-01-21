#!/bin/bash
# usage: ./section.sh inputFilePath codePath name
# and it will output a tar file containing the
# section notes, images and codes:
# section-name:
#  - notes
#    - imgs
#    - section.md
#    - section.html
#  - code
#    - (all the code files)

# input: chapters/chapter0-setup/0-notes.md
# htmlpath: output/html/chapter0-setup/0-notes.html

# Example
# ./section.sh chapters/chapter2-angular/1-components.md code/project-files/angular-examples/basic-component/ basic-component

if [ $# -gt 2 ]
  then
    INPUT=$1
    CODEPATH=$2
    NAME=$3

    KEY="chapters"
    REP="output/html"
    HTMLPATH=${INPUT/#$KEY/$REP}
    HTMLPATH=${HTMLPATH/".md"/".html"}

    INPUTFOLDER="$(dirname $INPUT)"

    SECTIONFOLDER="udemy/section-${NAME}"

    # remove the section
    rm -rf "udemy/section-${NAME}"
    mkdir -p "udemy/section-${NAME}"

    # copy the md file and the html file
    NOTEPATH="${SECTIONFOLDER}/notes/"
    mkdir -p $NOTEPATH
    cp $INPUT $NOTEPATH
    cp $HTMLPATH $NOTEPATH

    # copy the images of the input if the folder exists
    if [ -d "${INPUTFOLDER}/images" ]; then
      cp -r "${INPUTFOLDER}/images" "${SECTIONFOLDER}/notes"
    fi

    # copy project files
    mkdir -p "${SECTIONFOLDER}/code"
    cp -r "${CODEPATH}" "${SECTIONFOLDER}/code"

    # archive with today date
    TODAY=$(date '+%a-%h-%d-%Y')
    ZIPNAME="${NAME}-notes-code-${TODAY}.tar.gz"
    cd $SECTIONFOLDER && tar --exclude='.*' -zcvf "${ZIPNAME}" *

    echo "done"
else
  echo "Need three arguments."
  echo "Eg: ./section.sh chapters/chapter2-angular/1-components.md code/project-files/angular-examples/basic-component/ basic-component"
fi


