#!/bin/bash
# input a set of number copied from MATLAB
# convert them into LaTeX table format
# and copy them into the clipboard
echo "$1" | sed 's/    /\&/g' | tr -d '\n' | xclip -selection c
