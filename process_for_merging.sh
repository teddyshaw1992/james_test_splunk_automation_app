#!/bin/bash

#git add *
#git commit -m "Whatever you want"
#git push

#git checkout test

# Enforce using the default merge commit message
#git merge dev --no-edit --no-ff

# Get all the merges since the last tag
#git log `git describe --tags --abbrev=0`..HEAD --oneline
MERGE_COMMIT_INFO=$( git log --merges `git describe --tags --abbrev=0`..HEAD --oneline )


while read -r MERGE_COMMIT_INFO; do
  #echo "... ${KINGSHIT} ..."
  FROM_BRANCH=$( expr "${MERGE_COMMIT_INFO}" : '.* Merge branch \(.*\) into .*' )
  echo "${FROM_BRANCH}"

  TO_BRANCH=$( expr "${MERGE_COMMIT_INFO}" : '.* Merge branch .* into \(.*\)' )
  echo "${TO_BRANCH}"

done <<< "${MERGE_COMMIT_INFO}"
