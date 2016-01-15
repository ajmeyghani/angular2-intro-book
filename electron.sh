#! /bin/bash
# Create a list of all the html files
# For every line in the file, run: electron-pdf src dest where src is the html file
# and des is the destination.
# eg. electron-pdf output/html/file.html output/pdf/file.pdf
rm -rf output/pdf
rm -rf htmlfiles.txt
find output/html -type f -not \( -name "*-content.html" -o -path 'output/html/public*' \) > htmlfiles.txt
while read file; do
  INPUT=$file
  KEY="output/html"
  REP="output/pdf"
  DEST=${INPUT/#$KEY/$REP}

  PDFPATH=${DEST/.html/.pdf}
  PATH_TO_MAKE="$(dirname $PDFPATH)"
  mkdir -p $PATH_TO_MAKE
  echo "Converting ${PDFPATH}"
  electron-pdf $INPUT $PDFPATH
done <htmlfiles.txt
echo "Done!"
