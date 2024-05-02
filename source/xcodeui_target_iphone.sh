#!/bin/bash
osascript <<EOF
set targetApp to "Xcode"
set theMenu to "Product"
set theItem to "Destination"
set theSubItem to "iPhone"

tell application targetApp
    activate
    tell application "System Events"
        tell application process targetApp
            tell menu bar 1
                tell menu bar item theMenu
                    tell menu theMenu
                        tell menu item theItem
                            tell menu theItem
                                click menu item theSubItem
                            end tell
                        end tell
                    end tell
                end tell
            end tell
        end tell
    end tell
end tell
EOF
