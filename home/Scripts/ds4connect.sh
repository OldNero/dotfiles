#!/bin/zsh

MAC="97:DD:DF:2A:2C:41"

powered() {
    echo "show" | bluetoothctl | grep "Powered" | cut -d " " -f 2
}

connected() {
    echo "info ${MAC}" | bluetoothctl | grep "Connected" | cut -d " " -f 2
}

while true
do
    sleep 1
    if [ "$(powered)" = "yes" ] && [ "$(connected)" = "no" ]; then
        echo "connect ${MAC}" | bluetoothctl
        sleep 5
        if [ "$(connected)" = "yes" ]; then
            break  # Exit the loop if the device is connected
        fi
    fi
done

# Exit the script, which will close the console window
kill -9 CURRENT_PID=$(ps -o ppid= $$)
