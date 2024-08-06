#!/bin/sh
# shell script to prepend i3status with more stuff

i3status -c ./config | while :
do
        read line
        echo "mystuff | $line" || exit 1
done
