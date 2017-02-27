#!/bin/bash

function refreshMaster {
    git checkout master
    git pull
}

function getBranchName {
    echo "$(git name-rev --name-only HEAD)"
}

case "$1" in
    "branch")
        if [[ "$2" != "" ]]; then
            refreshMaster
            git checkout -b $2
        else
            echo "### Missing argument: branch name ###"
        fi
        ;;
    "rebase")
        if [[ $(getBranchName) == "master" ]]; then
            echo "####################################"
            echo "### Error: Cannot rebase master! ###"
            echo "####################################"
            exit 0;
        else
            refreshMaster
            git checkout -
            git rebase master
        fi
        ;;
    "delete-branches")
        git branch | grep -v "master" | xargs git branch -D
    ;;
    *)
        echo "### Invalid Option ###"
        exit 0
        ;;
esac
