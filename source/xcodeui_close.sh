#!/bin/bash
osascript <<EOF
activate application "Xcode"
tell application "System Events" to tell process "Xcode"
	keystroke "w" using command down
end tell
EOF
