#!/bin/sh

cd ~ || exit

tmp=$(/usr/bin/mktemp)
/usr/bin/termite -r task_dialog -e "ranger --choosefile=$tmp"

file=$(/usr/bin/cat "$tmp")

if [ -e "$file" ]
then
  exec /usr/bin/rifle "$file"
fi

rm "$tmp"
