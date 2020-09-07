for file in `ls figures-origin`; do
    convert -colorspace gray "figures-origin/$file" "figures/${file}"
done
