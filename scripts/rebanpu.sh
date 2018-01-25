#!/bin/sh

# This script rebases your current branch git origin master and pushes it to
# remote.
CURRENT_BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`

git fetch
git rebase origin/master
git push -f origin $CURRENT_BRANCH_NAME
