#!/bin/bash
PERMISSION=$1
DEVICE=$2
ADB=adb
SAY=echo
find ./prj|grep "app-dev-debug.apk"|while read APK;do
	PACKAGENAME=$(aapt dump badging "$APK"|grep package | awk '{print $2}' | sed s/name=//g | sed s/\'//g)
	if [ -z "$DEVICE" ]
	then
		$ADB devices|grep -v attached|grep device|cut -f1|while read DEVICE;do
			./android_app_print_permissions.sh "$PERMISSION" "$DEVICE"
		done
	else
		$SAY printing permissions
		$ADB -s "$DEVICE" shell dumpsys package $PACKAGENAME|grep perm
	fi
done

