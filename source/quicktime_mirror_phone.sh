#!/bin/bash
PHONE_NAME=$(ideviceinfo | grep -i DeviceName)
osascript <<EOF
on readyQuickTime()
	tell application "QuickTime Player"
		set newMovieRecording to new movie recording
	end tell
	
	tell application "System Events" to tell process "QuickTime Player"
		set frontmost to true
	end tell
end readyQuickTime
on openInputsMenu()
	ignoring application responses
		tell application "System Events" to tell process "QuickTime Player"
			click button 2 of window 1
			delay 1
		end tell
	end ignoring
	do shell script "killall 'System Events'"
end openInputsMenu

on setVideoInput(inputName)
	my openInputsMenu()
	tell application "System Events" to tell process "QuickTime Player"
		set inputMenu to menu 1 of button 2 of window 1
		set inputList to name of every menu item of inputMenu
		# log(inputList)
		repeat with menuItemPosition from 1 to length of inputList
			# log(menuItemPosition)
			# log(item menuItemPosition of inputList)
			if item menuItemPosition of inputList is inputName then
					click menu item menuItemPosition of inputMenu
					exit repeat
			end if
		end repeat
	end tell
end setVideoInput
readyQuickTime()
setVideoInput("iPhone")
EOF
