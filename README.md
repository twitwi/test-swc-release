
The "test1" folder has automatically taken the gh-pages branch from each repository and it has been generated with:

    ./tools/snapshot-lessons.sh test1
    git add test1
    git push

The "5.3" folder is taken from the tags v5.3 from each repository and it has been generated with:

    TAG=v5.3 ./tools/snapshot-lessons.sh 5.3
    git add 5.3
    git push

The "test2" folder illustrates custom configurations and uses v5.3 from two lessons + the D3 lesson in its latest version. It has been generated with:

    CONFIGURATION=tools/example-configuration-override.sh  ./tools/snapshot-lessons.sh test2
    git add test2
    git push
    # ^ 20MB
