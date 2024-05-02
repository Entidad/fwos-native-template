#!/bin/bash
osascript <<EOF
activate application "Xcode"
tell application "System Events" to tell process "Xcode"
    click menu "Product" of menu bar 1
    click menu item "Build" of menu "Product" of menu bar 1
end tell
EOF
