# if mouse is active disable it and vice versa

# get the id of the touchpad

id="Microsoft Surface 045E:09AF Touchpad"

state=$(xinput list-props "$id" | grep "Device Enabled" | grep -o "[01]$")

if [ "$state" -eq '1' ];then
  xinput --disable "$id"
else
  xinput --enable "$id"
  xinput --set-prop "$id" "libinput Accel Speed" 0.5
fi
