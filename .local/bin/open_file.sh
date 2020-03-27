#!/bin/sh
$PATH > /home/sandro/test
tmp=$(/usr/bin/mktemp)

cd ~ || exit

if [ "$1" = "ranger" ]
then
  /usr/bin/urxvt -geometry 120x30 -bg black -fg white -T file_select -e ranger --choosefile="$tmp"
else
  /usr/bin/urxvt -geometry 80x20 -bg black -fg green -T file_select -e /home/sandro/.local/bin/select_file.sh "$tmp"
fi
file=$(/usr/bin/cat "$tmp")
echo "$file"

if [ -e "$file" ]
then
  exec /usr/bin/rifle "$file"
fi
