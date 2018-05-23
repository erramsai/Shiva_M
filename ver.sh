#!/bin/bash

#To find the highest tag number
VERSION=`git describe --abbrev=0 --tags`

#To split the numbers into array
VERSION_BITS=(${VERSION//./ })

echo $VERSION_BITS
