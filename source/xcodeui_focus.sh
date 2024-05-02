#!/bin/bash
osascript <<EOF
activate application "Xcode"
tell application "System Events" to tell process "Xcode"
    set frontmost to true
end tell
EOF
