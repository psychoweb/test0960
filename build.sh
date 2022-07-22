#!/bin/bash

set -u
set +e

# check if command is running inside a git repo, get the name
REPO_DIR="$(basename $(git config --get remote.origin.url) .git)"
# get the name of the current dir
CURR_DIR="$(basename $(pwd))"
# they all have to be named like this
REPO_NAME="rocker.science-site"

if [[ "$REPO_DIR" == "$REPO_NAME" && "$CURR_DIR" == "$REPO_NAME" ]] ; then
    if [[ $# == 0 ]] ; then 
      echo "we can safely delete things."
      rm -rf docs
    fi
    hugo $@
else
    echo "something is not right"
fi
