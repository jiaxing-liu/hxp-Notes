# Ways to convert these notes to batch file, and then execute the commands line by line

autoinstall.sh

```bash
#!/bin/bash
input="$1"
echo $input
while IFS= read -r line
do
    eval $line
    if [[ $? != 0 ]]
    then
        echo "Command $line failed. Abroted."
        exit
    fi
done < "$input"
```

genbatch.sh

```bash
#!/bin/bash
input="$1"
if [[ -n $input ]]; then
    grep -v "^#.*$" "$input" | grep -v "^\`\`\`.*$" | grep -v "^$"
else
    echo "Usage: ./genbatch <note.md> > batch.bat"
fi
```

