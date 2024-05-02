#!/bin/bash
#brew install jq
#be sure to use correct xcode using xcodeselect
xcrun simctl list --json devices available | jq '.devices | to_entries[]| (.key | capture("com\\.apple\\.CoreSimulator\\.SimRuntime\\.iOS-(?<version>.+)")) as {$version}| .value[] | {name: "\(.name) (\($version|sub("-"; ".")))", udid, state}'
#xcrun simctl list --json devices available  | jq '.devices | to_entries[]| (.key | capture("com\\.apple\\.CoreSimulator\\.SimRuntime\\.iOS-(?<version>.+)")) as {$version}| .value[] | {name: "\(.name) (\($version|sub("-"; ".")))", udid, state}|select(.state == "Booted")'
