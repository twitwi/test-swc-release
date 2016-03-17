#!/bin/bash

set -e

W=$(dirname $(readlink -f $0))
. $W/configuration.sh

if [ "$(pwd)" = "$W" ] ; then
    echo "This script should probably not be run run from the $W folder, but rather from its parent (or somewhere else)."
    exit
fi

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

mkdir "$sub"
cd "$sub"
for lesson in $(all_lessons) ; do
    git clone "${giturls[$lesson]}" "$lesson"
    cd "$lesson"
    git checkout "${gitvers[$lesson]}"
    make -j 4 preview # to be replaced by jekyll, later (with maybe an autodetect)
    rm -rf .git
    cleanup_lesson
    cd -
done
cd -




echo -------
echo - end -
