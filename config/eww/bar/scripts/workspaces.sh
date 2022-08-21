#!/bin/sh

ACTIVEICON=""
OCCUPIEDICON=""
EMPTYICON=""
URGENTICON=""

generate_yuck() {
  workspace=$1
  additional_settings=$2
  focused=$(bspc query -D -d .focused --names | grep $workspace)
  occupied=$(bspc query -D -d .occupied --names | grep $workspace)
  urgent=$(bspc query -D -d .urgent --names | grep $workspace)

  icon=$EMPTYICON
  state_class="empty"

  if [ ! -z $occupied ]; then
    icon=$OCCUPIEDICON
    state_class="occupied" 
  fi

  if [ ! -z $urgent ]; then 
    icon=$URGENTICON
    state_class="urgent" 
  fi

  if [ ! -z $focused ]; then 
    icon=$ACTIVEICON 
    state_class="active" 
  fi

  echo "(button :class \"workspace-icon $state_class $additional_settings\" :onclick \"bspc desktop -f $workspace\" \"$icon\")   "
}

workspace_module() {

  array_names=(1 2 3 4 5)

  result=""

  for i in "${array_names[@]}"; do
    special_workspace=""
    if [ $i -eq 1 ]; then
      special_workspace='-first'
    elif [ $i -eq ${#array_names[@]} ]; then
      special_workspace='-last'
    fi

    result="${result}$(generate_yuck $i $special_workspace)"
  done

  echo "(box :class \"workspaces\" :orientation \"v\" :space-evenly \"false\"  $result)"
}

workspace_module
bspc subscribe desktop node_transfer | while read -r _ ; do
workspace_module
done
