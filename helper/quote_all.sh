#!/bin/bash

FILES=$(find $1 -name '*.yml')

for f in $FILES; do
	./quote.sh $f
done
