#!/bin/sh

cd ~ || exit

tmp=$(/usr/bin/mktemp)
/usr/bin/kitty --class=task_dialog --name=file_select ranger --choosefile="$tmp"

file=$(/usr/bin/cat "$tmp")

if [ -e "$file" ]
then
  exec /usr/bin/rifle "$file"
fi

rm "$tmp"
