#!/bin/bash
set -o pipefail
DESTINATION="platform=iOS,name=iPhone"
DESTINATION="platform=iOS Simulator,name=iPhone 13"
SCHEME=nativeTemplate
SCHEME=Dev
SAY=sam
SAY=say
$SAY building
pushd ./
#rm -rf ./prj/ios/build
cd ./prj/ios
#DEVELOPMENT_TEAM=Entidad \
	xcodebuild build \
	-workspace NativeTemplate.xcworkspace \
	-scheme "$SCHEME" \
	-destination "$DESTINATION" \
	-derivedDataPath build \
	-configuration Debug \
	-verbose 2>&1
# | grep -A 5 error:
EXITCODE=$?
test $EXITCODE -eq 0 && $SAY "build complete" || $SAY "build failed"
popd
exit $EXITCODE
