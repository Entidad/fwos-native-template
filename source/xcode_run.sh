#!/bin/bash
SAY=sam
SAY=say
$SAY building
cd ./prj/ios
#simulator
#xcodebuild run -workspace NativeTemplate.xcworkspace -scheme nativeTemplate -destination 'platform=iOS Simulator,name=iPhone 13'
#connected phone
xcodebuild run -workspace NativeTemplate.xcworkspace -scheme nativeTemplate -destination 'platform=iOS,name=iPhone'
EXITCODE=$?
test $EXITCODE -eq 0 && $SAY "build complete" || $SAY "build failed"
exit $EXITCODE
