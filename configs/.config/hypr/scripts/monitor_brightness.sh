# Function to adjust brightness using ddcutil
adjust_brightness() {
  local current_brightness=$(ddcutil getvcp 10 | awk '{print $9}' | sed 's/,//g' )
  local change="$1"
  local value="$2"

  if [[ "$change" == "up" ]]; then
    local brightness_value=$((current_brightness + value))
  elif [[ "$change" == "down" ]]; then
    local brightness_value=$((current_brightness - value))
  else
    local brightness_value="$change"
  fi

  echo $brightness_value

  if [ "$brightness_value" -ge 0 ] && [ "$brightness_value" -le 100 ]; then
    # Set the brightness using ddcutil
    ddcutil setvcp 10 "$brightness_value"
    notify-send -t 3000 "Brightness set to %s\n" "$brightness_value"
  else
    echo "Error: Brightness value must be between 0 and 100."
  fi
}

adjust_brightness "$1" "$2"
