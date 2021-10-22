#!/bin/bash
input="$1"
if [[ -n $input ]]; then
    grep -v "^#.*$" "$input" | grep -v "^\`\`\`.*$" | grep -v "^$"
else
    echo "Usage: ./genbatch <note.md> > batch.bat"
fi

