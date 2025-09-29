#!/bin/bash

# Detect OS
OS=$(uname)

while :; do
  if [[ "$OS" == "Darwin" ]]; then
    # macOS
    POWER_STATUS=$(pmset -g ps | head -1)
    if [[ "$POWER_STATUS" != *"AC Power"* ]]; then
      say "Security Alarm: Laptop is unplugged!"
      sleep 4
    fi
  else
    # Linux
    if acpi -a | grep -q "off-line"; then
      spd-say "Security Alarm: Laptop is unplugged!"
      sleep 4
    fi
  fi
  sleep 1
done
