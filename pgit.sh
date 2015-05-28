#!/bin/bash

function refreshMaster {
    git checkout master
    git pull
}

case "$1" in
    "branch")
        if [[ "$2" != "" ]]; then
            refreshMaster
            git checkout -b $2
        else
            echo "### Missing branch name argument ###"
        fi
    ;;
    "rebase")
        refreshMaster
        git checkout -
        git rebase
    ;;
    *)
        echo "### Invalid Option ###"
        exit 0
    ;;
esac
