#!/bin/sh
sed -i \
         -e 's/#dedede/rgb(0%,0%,0%)/g' \
         -e 's/#333333/rgb(100%,100%,100%)/g' \
    -e 's/#2c2c2c/rgb(50%,0%,0%)/g' \
     -e 's/#169f6f/rgb(0%,50%,0%)/g' \
     -e 's/#ffffff/rgb(50%,0%,50%)/g' \
     -e 's/#2c2c2c/rgb(0%,0%,50%)/g' \
	*.svg
