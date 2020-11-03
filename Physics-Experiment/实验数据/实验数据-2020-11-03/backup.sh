#!/bin/bash
echo "Commit Message:"
read -r MSG
git add '分光计实验数据.xlsx'
git commit -m "$MSG"
git push origin master
cp '分光计实验数据.xlsx'\
  "/run/media/hxp/NTFS_Drive_HXP/分光计实验数据-$(date +%H-%M-%S).xlsx"
