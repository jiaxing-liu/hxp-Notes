#!/bin/bash
# description: shell script to create experiment preview report
# author: hxp
# email: hxp201406@gmail.com

printf '输入实验内容：'
read -r TITLE
cp "模板.tex" "$TITLE.tex"
sed -i "s/实验标题/$TITLE/g" "$TITLE.tex"
echo "已生成$TITLE.tex"
