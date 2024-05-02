#!/bin/bash
osascript <<EOF
activate application "QuickTime Player"
tell application "System Events" to tell process "QuickTime Player"
    set frontmost to true
end tell
EOF
