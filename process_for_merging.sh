#!/bin/bash

git add *
git commit -m "Whatever you want"
git push

git checkout test

# Enforce using the default merge commit message
git merge dev --no-edit --no-ff

# Get all the commits since the last tag
git log `git describe --tags --abbrev=0`..HEAD --oneline


