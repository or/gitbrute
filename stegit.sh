#!/bin/bash -e

revision_range=$1
input_pattern=$2
target_branch=$3

revisions=$(git rev-list --no-merges --reverse $revision_range)
revisions_array=($revisions)

git checkout master
git branch -D $target_branch || true
git checkout -b $target_branch ${revisions_array[0]}^

patterns=($(cat $input_pattern))

pattern_length=${#patterns[@]}
i=0
apply_pattern=1
for rev in $revisions; do
    git cherry-pick --allow-empty --keep-redundant-commits $rev
    if [ $apply_pattern -eq 1 ]; then
        pattern=$(echo ${patterns[(( pattern_length - 1 - i ))]} | sed -e 's/1/[abcdef]/g' -e 's/0/[0123456789]/g')
        go run gitbrute.go --pattern "^$pattern"
    fi
    ((i = (i + 1) % pattern_length)) || true
    if [ $i -eq 0 ]; then
        apply_pattern=0
    fi
done
