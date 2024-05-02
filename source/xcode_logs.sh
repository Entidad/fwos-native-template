#!/bin/bash
#brew install libimobiledevice
UDID=$(idevice_id --list)
#idevicesyslog --no-colors --no-kernel -u $UDID
#deviceconsole -d -u <device UDID> | uniq -u && echo "<device name>"
idevicesyslog  --no-colors -p FacetecDev -u $UDID
