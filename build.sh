#!/bin/sh
jekyll build
rsync --exclude ".*" -r  _site/ ../ginger-io.github.io/