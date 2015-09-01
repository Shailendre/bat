#author: Shailendra Singh, Sept 1 2015.
#shell-script which makes beep sound on discharge and complete charge

percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | tr -cd '[[:digit:]]');
state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | cut -d: -f2);


while [ true ]; do
#discharge state
if [ $percentage -le 10 -a $state == 'discharging' ]; then
    #play the alert sound
    aplay beep-05.wav;
fi
#charged state
if [ $percentage -eq 100 -a $state == 'charging' ]; then
    #play the alert sound
    aplay beep-05.wav;
fi

sleep 15;
percentage=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | tr -cd '[[:digit:]]');
state=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | cut -d: -f2);

done
