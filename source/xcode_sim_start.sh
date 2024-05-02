#!/bin/bash
SAY=sam
SAY=say
$SAY simulating
APP_PATH=./prj/ios/build/Build/Products/Debug-iphonesimulator/App.app
APP_PATH=./prj/ios/build/Build/Products/Debug-iphoneos/App.app
APP_PATH=./prj/ios/build/Build/Products/Debug-iphonesimulator/AppDev.app
APP_PATH=./prj/ios/build/Build/Products/Debug-iphonesimulator/FacetecDev.app
DEVICETYPEID="iPhone 13 (17.0)"
DEVICETYPEID="iPhone 13"
DEVICETYPEID="iPhone-13, 15.2"
DEVICETYPEID="com.apple.CoreSimulator.SimDeviceType.iPhone-13"
DEVICETYPEID="com.apple.CoreSimulator.SimDeviceType.iPhone-13"
DEVICETYPEID="4CD91262-59E3-45A7-BAD8-17E9A73C6A1F"
DEVICETYPEID="iPhone-13"
DEVICETYPEID="iPhone-13, 17.0"
ios-sim launch $APP_PATH --devicetypeid "$DEVICETYPEID"
EXITCODE=$?
test $EXITCODE -eq 0 && $SAY "simulated" || $SAY "simulation failed"
exit $EXITCODE
