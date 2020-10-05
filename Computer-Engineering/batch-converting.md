# Useful bash Scripts to Batch Convert

remove all the spaces from filename:

```bash
for f in *; do mv "$f" `echo $f | tr ' ' '_'`; done
```

convert all mkv to mp4:

```bash
mkdir -p mp4convert;
target_dir=$1
cd $target_dir;
for file in `ls *.mkv`;
do
    cp "$file" "../mp4convert/$file";
done
cd ../$target_dir;
for file in `ls *.mkv`;
do
    filename=$(echo $file | cut -f -1 -d '.');
    ffmpeg -i $file $filename.mp4;
done
cd ..
```