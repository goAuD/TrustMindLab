#!/bin/bash
# Checks if akmods/nvidia kernel module is built for the current kernel

LOG=~/.akmods-check.log
date "+%Y. %b. %d., %A, %T %Z:" >> "$LOG"

if ! rpm -q kmod-nvidia > /dev/null; then
  echo "❌ akmods not yet available." >> "$LOG"
else
  echo "✅ akmods present." >> "$LOG"
fi
