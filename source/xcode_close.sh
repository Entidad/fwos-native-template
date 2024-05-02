#!/bin/bash
osascript -e 'tell app "XCode" to close window 0'
sleep 1
./xcode_kill.sh
