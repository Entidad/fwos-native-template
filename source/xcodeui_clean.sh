#!/bin/bash
osascript <<EOF
activate application "Xcode"
tell application "System Events" to tell process "Xcode"
    click menu "Product" of menu bar 1
    click (menu item 1 where its name starts with "Clean Build Folder") of menu "Product" of menu bar 1
end tell
EOF
