# Useful bash Scripts to Batch Convert

remove all the spaces from filename:

```bash
for f in *; do mv "$f" "$(echo $f | tr ' ' '_')"; done
```

convert all mkv to mp4:

```bash
mkdir -p mp4convert;
target_dir=$1
cd $target_dir;
for file in `ls *.mkv`;
do
    mv "$file" "../mp4convert/$file";
done
cd ..
```

```bash
target_dir=$1;
cd mp4convert;
for file in `ls *.mkv`;
do
    filename=${file%.*};
    ffmpeg -i $file "../$target_dir/$filename.mp4";
done
cd ..

```
