#!/bin/bash
kill $(ps aux | grep 'Xcode' | awk '{print $2}')
#sudo /Library/Developer/XcodeServer/CurrentXcodeSymlink/Contents/Developer/usr/bin/xcscontrol  --shutdown
