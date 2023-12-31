#!/usr/bin/env bash

VSIX_FILES="*.vsix"

if [[ -z "$1" ]]; then
    vsix_dir="$(pwd)/extensions"
else
    vsix_dir=`realpath "$1"`
fi
if [[ ! -d $vsix_dir ]]; then
    echo "$vsix_dir is not a directory! Exiting!"
    return
fi

for i in $vsix_dir/$VSIX_FILES; do
    [ -f "$i" ] || break
    echo "Installing $i"
    code-server --install-extension $i
done
