#!/bin/bash

read -p "The name of the file: " name
if [ -f "$name.yml" ]; then
	echo "File $name.yml already exists! Aborting";
	exit;
fi

FILE="$name.yml"
touch $FILE

echo "---" >> $FILE

read -p "The full name of the conference: " fullname
echo "fullname: \"$fullname\"" >> $FILE

read -p "The abbreviation of the conference: " abbr
echo "abbr: \"$abbr\"" >> $FILE

echo "time: " >> $FILE
read -p "The starting time of the conference: " start_time
echo "  start: $start_time" >> $FILE
read -p "The closing time of the conference: " end_time
echo "  end: $end_time" >> $FILE

read -p "The host organization of the conference: " host
echo "host: \"$host\"" >> $FILE

read -p "The url of the conference: " url
echo "url: \"$url\"" >> $FILE

read -p "The hosting place of the conference: " place
echo "place: \"$place\"" >> $FILE

echo "---" >> $FILE

echo "The output of $FILE is"
cat $FILE
