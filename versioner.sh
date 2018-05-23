#!/bin/bash

#To find the highest tag number.
VERSION=`git describe --abbrev=0 --tags`

#To split the numbers into array.
VERSION_BITS=(${VERSION//./ })

#To get the number parts from array.
VNUM1=${VERSION_BITS[0]}
VNUM2=${VERSION_BITS[1]}
VNUM2=$((VNUM2+1))


#Create a new tag
NEW_TAG="$VNUM1.$VNUM2"

#get current hash and see if it already has a tag
GIT_COMMIT=`git rev-parse HEAD`
NEEDS_TAG=`git describe --contains $GIT_COMMIT`

if [ -z "$NEEDS_TAG" ]; then
    echo "Tagged with $NEW_TAG (Ignoring fatal:cannot describe - this means commit is untagged) "
    git tag $NEW_TAG
    git add .
    git push --tags
else
    echo "Already a tag on this commit"
fi
