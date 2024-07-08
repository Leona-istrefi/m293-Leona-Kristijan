#!/bin/bash

# bestehenden Ziel-Dateien löschen
rm ./dist/*.html
rm ./dist/*.css

# minify
npx html-minifier --input-dir ./src --output-dir ./dist --collapse-whitespace --file-ext html
npx css-minify -d ./src -o ./dist
# entferne .min.css
for i in ./dist/*.min.css ; do mv "$i" "${i/.min.css/.css}" ; done
exit 0