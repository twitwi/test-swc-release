
# The "tools" folder

It contains a bunch of shell files:
- `snapshot-lessons.sh`: the only *runnable* script
- `configuration-tools.sh`: some tools (bash variables and functions)
- `configuration.sh`: the default configuration
- `example-configuration-override.sh`: an example custom configuraton (see test2 below)



# Other folders are releases

The "test1" folder has automatically taken the gh-pages branch from each repository and it has been generated with:

    ./tools/snapshot-lessons.sh test1
    git add test1
    git push

The "5.3" folder is taken from the tags v5.3 from each repository and it has been generated with:

    TAG=v5.3 ./tools/snapshot-lessons.sh 5.3
    git add 5.3
    git push

The "test2" folder illustrates custom configurations and uses v5.3 from two lessons + the D3 lesson in its latest version. It has been generated with a [custom configuration](https://github.com/twitwi/test-swc-release/blob/gh-pages/tools/example-configuration-override.sh):

    CONFIGURATION=tools/example-configuration-override.sh  ./tools/snapshot-lessons.sh test2
    git add test2
    git push
    # ^ 20MB
