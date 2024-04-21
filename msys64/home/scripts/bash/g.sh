#!/bin/bash

#alias filesincommit='f() { git diff-tree --no-commit-id --name-only -r "$1"; }; f'
#alias girc='git rebase --continue'
#alias giri='f(){ git rebase -i HEAD~"$1"; }; f'
#alias gich='f(){ git checkout "$1";}; f'
#alias gichb='f(){ git checkout -b "$1";}; f'
#alias grr='f(){ git remote set-url origin "$1;" }; f'
#alias gar='f(){ git remote set-url --add origin "$1";}; f'

commands=("commit history" "tag" "branches" "variables" "remotes" "gc" "purge"
  "edit local .gitconfig" "edit global .gitconfig" "init" "add remote"
  "add all" "add single" "commit" "push" "push --force" "clone")
selected=$(printf '%s\n' "${commands[@]}" | fzf --header="git:")
case $selected in
  "commit history")
    git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"  | \
      fzf --ansi --no-sort --reverse --tiebreak=index --preview \
      'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
      --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
              (grep -o '[a-f0-9]\{7\}' | head -1 |
              xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
              {}
    FZF-EOF" --preview-window=right:60%
    ;;
  "tag")
    git tag ;;
  "branches")
    git branch -v ;;
  "variables")
    git var -l ;;
  "remotes")
    git remote -v ;;
  "gc")
    git gc ;;
  "purge")
    while true; do
      read -p "Do you really want to purge this repo? [y/n] " yn
      case $yn in
        [Yy]* ) git checkout --orphan TEMP_BRANCH; git add -A; git commit -am "Initial commit"; git branch -D master; git branch -m master; git push -f origin master ; break;;
        [Nn]* ) break;;
        * ) ;;
      esac
    done ;;
  "edit local .gitconfig")
    $EDITOR .git/config;;
  "edit global .gitconfig")
    $EDITOR ~/.gitconfig;;
  "init")
    echo "gii is more handy, isn't it?";;
    #git init ;;
  "add remote")
    read -p "remote: " remote_address; git remote add origin "$remote_address" ;;
  "add all")
    echo "gia is more handy, isn't it?";;
    #while true; do
    #  read -p "Add all unstage files to git? [y/n] " yn
    #  case $yn in
    #    [Yy]* ) git add .; break;;
    #    [Nn]* ) break;;
    #    * ) ;;
    #  esac
    #done
    #;;
  "add single")
    read -p "file: " file; git add "$file" ;;
  "commit")
    echo "gic is more handy, isn't it?";;
    #read -p "commit message: " message; git commit -m "$message" ;;
  "push")
    echo "gip is more handy, isn't it?";;
    #git push ;;
  "push --force")
    git push --force ;;
  "clone")
    read -p "clone from url: " url; git clone "$url" ;;
esac