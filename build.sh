#!/bin/sh
jekyll build
rm _site/build.sh
rsync --exclude ".*" --delete -r  _site/ ../ginger-io.github.io/