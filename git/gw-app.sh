#!/bin/bash

add() {
  dialog --title  "Adding existing branch to worktree" --inputbox "Branch name" 0 0 "" 2>branch.txt
  branch=$(cat branch.txt)
  rm branch.txt
  msg=$(git worktree add ../"$branch" && cd ../"$branch")
  dialog --msgbox "$msg" 0 0  
}

add_new() {
  dialog --title "Adding new branch to worktree" --inputbox "Branch name" 0 0 "" 2>branch.txt
  branch=$(cat branch.txt)
  rm branch.txt
  msg=$(git worktree add -b "$branch" ../"$branch" && cd ../"$branch" && git push -u origin "$branch")
  dialog --msgbox "$msg" 0 0  
}

list() {
  dialog --title "Listing branches in current worktree" \
    --msgbox "$(git worktree list | awk 'NR!=1{print substr($3, 2, length($3) -2) " " $2 }')" 0 0
}

fetch() {
  dialog --title "Fetching from remote" \
    --menu "Branch" 0 0 0 $(git worktree list | awk 'NR!=1{print substr($3, 2, length($3) -2) " " $2 }') 2>branch.txt
  branch=$(cat branch.txt)
  rm branch.txt
  msg=$(git fetch origin +refs/heads/*:refs/heads/* --prune && cd ../"$branch" && git reset --hard && cd ../bare)
  dialog --msgbox "$msg" 0 0  
}

remove() {
  dialog --title "Removing worktree branch" \
    --menu "Removing $branch from the worktree - Warning! Command is forced!!" \
    0 0 0 $(git worktree list | awk 'NR!=1{print substr($3, 2, length($3) -2) " " $2 }') 2>branch.txt
  branch=$(cat branch.txt)
  rm branch.txt
  msg=$(git worktree remove ../"$branch" --force)
  dialog --msgbox "$msg" 0 0  
}

display_menu() {
  dialog --menu "Git worktree" 0 0 5 \
    "1" "Add existing branch to worktree" \
    "2" "Add new branch to worktree and push to remote"  \
    "3" "List the current branches in the worktree" \
    "4" "Fetch from remote" \
    "5" "Remove branch from worktree" 2>menu.txt
  
  selection=$(cat menu.txt)
  rm menu.txt
  case $selection in
    "1" ) add ; display_menu ;;
    "2" ) add_new ; display_menu ;;
    "3" ) list ; display_menu ;;
    "4" ) fetch ; display_menu ;;
    "5" ) remove ; display_menu ;;
  esac
}

display_menu
