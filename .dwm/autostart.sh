#!/bin/bash

nitrogen --restore &
compton &

bar() {
  dte=$(date +"%d %b %Y (%A), %H:%M:%S")
  bat=$(cat /sys/class/power_supply/BAT0/capacity)
  status=$(cat /sys/class/power_supply/BAT0/status)

  if [[ "$status" == "Discharging" ]]; then
	  state="D"
  else
	  state="C"
  fi



  echo -e "BAT: $bat% $state | $dte"
}

while true; do
  xsetroot -name "$(bar)"
  sleep 1
done &
