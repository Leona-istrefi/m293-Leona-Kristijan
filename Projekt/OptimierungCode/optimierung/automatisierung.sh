#!/bin/bash

# bestehenden Ziel-Dateien löschen
rm ./dist/*
rm -r ./dist/assets
rm -r ./dist/fotos

cp -r ./src/assets ./dist/assets
cp -r ./src/fotos ./dist/fotos
# minify
npx html-minifier --input-dir ./src --output-dir ./dist --collapse-whitespace --file-ext html
npx css-minify -d ./src -o ./dist
# entferne .min.css
for i in ./dist/*.min.css ; do mv "$i" "${i/.min.css/.css}" ; done

#ftp
HOST='kristijanlisica.bplaced.net'
USER='kristijanlisica'
PASSWD='>5W}N.qKE7&#j&F'
FILE='test.txt'

ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
binary
cd www/carspage
lcd dist
prompt
mput *
cd fotos
lcd fotos
mput *
cd ..
lcd ..
cd assets
lcd assets
mput *
quit
bye
END_SCRIPT
exit 0