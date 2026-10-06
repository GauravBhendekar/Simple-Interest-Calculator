#!/usr/bin/env bash

read -rp "Enter principal amount: " principal
read -rp "Enter rate of interest (%): " rate
read -rp "Enter time period (years): " time

if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "Error: Principal, rate, and time must be valid numbers."
  exit 1
fi

if (( $(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { print (p < 0 || r < 0 || t < 0) ? 1 : 0 }') )); then
  echo "Error: Principal, rate, and time cannot be negative."
  exit 1
fi

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p * r * t) / 100 }')
total=$(awk -v p="$principal" -v i="$interest" 'BEGIN { printf "%.2f", p + i }')

echo "Simple Interest: $interest"
echo "Total Amount: $total"
