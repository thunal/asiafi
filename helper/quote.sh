#!/bin/bash

FILE=$1

TMP_IN=".in"
TMP_OUT=".out"

cat $FILE > $TMP_OUT \
	&& mv $TMP_OUT $TMP_IN

cat $TMP_IN | sed 's/^fullname: \([^\"].*\)$/fullname: \"\1\"/' > $TMP_OUT \
	&& mv $TMP_OUT $TMP_IN

cat $TMP_IN | sed 's/^abbr: \([^\"].*\)$/abbr: \"\1\"/' > $TMP_OUT \
	&& mv $TMP_OUT $TMP_IN

cat $TMP_IN | sed 's/^host: \([^\"].*\)$/host: \"\1\"/' > $TMP_OUT \
	&& mv $TMP_OUT $TMP_IN

cat $TMP_IN | sed 's/^url: \([^\"].*\)$/url: \"\1\"/' > $TMP_OUT \
	&& mv $TMP_OUT $TMP_IN

cat $TMP_IN | sed 's/place: \([^\"].*\)$/place: \"\1\"/' > $TMP_OUT \
	&& mv $TMP_OUT $TMP_IN

cat $TMP_IN | sed '0,/^  \([[:digit:]].*\)$/{s/^  \([[:digit:]].*\)$/  start: \1/}' > $TMP_OUT \
	&& mv $TMP_OUT $TMP_IN

cat $TMP_IN | sed '0,/^  \([[:digit:]].*\)$/{s/^  \([[:digit:]].*\)$/  end: \1/}' > $TMP_OUT \
	&& mv $TMP_OUT $TMP_IN

cat $TMP_IN | sed '/.*none.*/d' > $TMP_OUT \
	&& mv $TMP_OUT $TMP_IN

cat $TMP_IN

mv $TMP_IN $FILE
