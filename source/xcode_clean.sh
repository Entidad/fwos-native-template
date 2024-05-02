#!/bin/bash
SAY=sam
SAY=say
$SAY cleaning
rm -rf ./prj/ios/build
#cd ./prj/ios
#simulator
#xcodebuild clean -workspace NativeTemplate.xcworkspace -scheme nativeTemplate -destination 'platform=iOS Simulator,name=iPhone 13'
#connected phone
#xcodebuild clean -workspace NativeTemplate.xcworkspace -scheme nativeTemplate -destination 'platform=iOS,name=iPhone'
#xcodebuild clean -workspace NativeTemplate.xcworkspace -scheme nativeTemplate -destination 'platform=iOS Simulator,name=iPhone 13' -derivedDataPath build -configuration Debug  2>&1

EXITCODE=$?
test $EXITCODE -eq 0 && $SAY "cleaning complete" || $SAY "cleaning failed"
