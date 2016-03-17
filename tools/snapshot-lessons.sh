#!/bin/bash

### Script setup

set -e
W=$(dirname $(readlink -f $0))

if [ "$(pwd)" = "$W" ] ; then
    echo "This script should probably not be run run from the $W folder, but rather from its parent (or somewhere else)."
    exit
fi


### Configuration

. $W/configuration-tools.sh
# simple way to have a local (test) configuration
if [ -f "$CONFIGURATION" ] ; then
    . $CONFIGURATION
else
    # default repositories configuration
    . $W/configuration.sh
fi


### Parameters and environment

function usage() {
    echo "$0 dirname"
}
if [ $# != 1 ] ; then
    usage
    exit
fi
sub="$1"

if [ -e "$sub" ] ; then
    echo "$sub already exists"
    exit
fi
if [ "$TAG" != "" ] ; then
    set_all_versions "$TAG"
fi


### Go

mkdir "$sub"
cd "$sub"
for lesson in $(all_lessons) ; do
    echo "<li><a href='$lesson'>$lesson</a></li>" >> index.html
    echo "$lesson" >> .lessons
    echo "url: ${giturls[$lesson]}" >> .lessons
    echo "version: ${gitvers[$lesson]}" >> .lessons
    git clone "${giturls[$lesson]}" "$lesson"
    cd "$lesson"
    git checkout "${gitvers[$lesson]}"
    echo "sha1: $(git rev-parse HEAD)" >> ../.lessons
    # build
    if [ -f .nojekyll ] ; then
        make -j 4 preview
        # else, use jekyll (if we port lessons)
    fi
    # cleanup
    rm -rf .git
    rm -rf _layouts
    rm -rf _includes
    #
    cd -
done
cd -




echo -------
echo - end -
