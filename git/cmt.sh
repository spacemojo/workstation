#!/bin/bash

prompt_for_jira() {
  dialog --inputbox "JIRA" 10 10 "" 2>jira.txt 
  JIRA=$(cat jira.txt)
  rm jira.txt
}

prompt_for_type() {
  dialog --radiolist "Commit type" 0 0 12 \
    "feat" "Features" false \
    "wip" "Work in progress" true \
    "fix" "Bug Fixes" false \
    "docs" "Documentation" false \
    "style" "Styles" false \
    "refactor" "Code Refactoring" false \
    "perf" "Performance Improvements" false \
    "test" "Tests" false \
    "build" "Builds" false \
    "ci" "Continuous Integrations" false \
    "chore" "Chores" false \
    "revert" "Reverts" false 2>ctype.txt 
  CTYPE=$(cat ctype.txt)
  rm ctype.txt
}

prompt_for_scope() {
  dialog --inputbox "Scope" 10 10 "" 2>scope.txt 
  SCOPE=$(cat scope.txt)
  rm scope.txt
}

prompt_for_message() {
  dialog --inputbox "Commit message body" 0 0 2>message.txt
  MESSAGE=$(cat message.txt)
  rm message.txt
}

display_message() {
  clear
  echo "$JIRA - $CTYPE($SCOPE): $MESSAGE"
  
}

validate() {
  if [ -z "$CTYPE" ]
  then
    dialog --title "Validation error" \
      --yesno "A type must be selected, retry ?" 0 0
    response=$?
    case $response in
      0) prompt_for_type ; validate ;;
      1) exit 127 ;;
      255) exit 0 ;;
    esac
  fi
  if [ -z "$JIRA" ]
  then
    dialog --title "Validation error" \
      --yesno "JIRA Ticket number cannot be empty, retry ?" 0 0
    response=$?
    case $response in
      0) prompt_for_jira ; validate ;;
      1) exit 127 ;;
      255) exit 0 ;;
    esac
  fi
  if [ -z "$SCOPE" ]
  then 
    dialog --title "Validation error" \
      --yesno "Scope cannot be empty, retry ?" 0 0
    response=$?
    case $response in
      0) prompt_for_scope ; validate ;;
      1) exit 127 ;;
      255) exit 0 ;;
    esac
  fi
  if [ -z "$MESSAGE" ]
  then
    dialog --title "Validation error" \
      --yesno "Message cannot be empty, retry ?" 0 0
    response=$?
    case $response in
      0) prompt_for_message ; validate ;;
      1) exit 127 ;;
      255) exit 0 ;;
    esac
  fi
  display_message
}

prompt_for_jira
prompt_for_type
prompt_for_scope
prompt_for_message
validate

