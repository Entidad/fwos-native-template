#!/bin/bash
SAY=sam
SAY=say
$SAY deploying
APP_PATH=./prj/ios/build/Build/Products/Debug-iphonesimulator/App.app
APP_PATH=./prj/ios/build/Build/Products/Debug-iphonesimulator/AppDev.app
APP_PATH=./prj/ios/build/Build/Products/Debug-iphoneos/App.app
APP_PATH=./prj/ios/build/Build/Products/Debug-iphonesimulator/AppDev.app
APP_PATH=./prj/ios/build/Build/Products/Debug-iphoneos/AppDev.app
#https://www.npmjs.com/package/ios-deploy?activeTab=readme
ios-deploy -r -b $APP_PATH -L
EXITCODE=$?
test $EXITCODE -eq 0 && $SAY "deployed" || $SAY "deployment failed"
exit $EXITCODE
