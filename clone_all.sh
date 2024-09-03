#!/bin/bash
# clone all the user repos from github to home folder
filename=$(basename "$1")
limit=100

if [ $# -eq 1 ]; then
  gh repo list "$1" --limit "$limit" | while read -r repo _; do
    gh repo clone "$repo" "$HOME/$repo"
  done
else
  echo -e "Usage: $filename <github username>"
fi
