#!/bin/bash

res &
nitrogen --restore &
compton &

dte() {
  dte=$(date +"%d %b %Y (%A), %H:%M:%S")
  echo -e "$dte"
}

while true; do
  xsetroot -name "$(dte)"
  sleep 1
done &
