# Meant to be source'd

declare -A giturls
declare -A gitvers

### Tools
function add_swc_lesson() {
    local lesson="$1"
    giturls[$lesson]=https://github.com/swcarpentry/$lesson.git
}
function all_lessons() {
    echo ${!giturls[@]}
}
function set_all_versions() {
    local version="$1"
    for lesson in $(all_lessons) ; do
        gitvers[$lesson]="$version"
    done
}

