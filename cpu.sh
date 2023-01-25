#!/bin/sh

str=`sensors | awk '/Core 0/ { print $3}' | sed 's/+//' | sed 's/C//'`

echo $str
