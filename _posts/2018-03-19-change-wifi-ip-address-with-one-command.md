---
title: Change Network Location with one command
layout: post_page
---

My office allows me to connect internet with static IP address. Except my office environment, it is natural to use DHCP in any places likce coffee shop, home and other places. To control this environment switching, I set Location feature on Mac OSX Network settings. This helps me to follow two regular steps when going to the office. 
* Switch wifi ap to my office  from other DHCP managed wifi ap (Vice versa when leaving from the office)
* Change Location from Automatic to office (Vice versa when leaving from the office)

Although things are clear what I have to do, I would like to automate the second step because one location can linked to one Wifi AP. So I created a shell script and type this script to save a very little chore. You can put this script where indicated in PATH variable. (eg. /bin /usr/bin or wherever you want to add in the PATH variable)


Hope this is helpful for you to reduce daily and timely chore to select Location on Mac OSX.

```
!/bin/bash

# automatically change Location configuration of Mac OS X 

SSID=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I\
 | grep ' SSID:' | cut -d ':' -f 2 | tr -d ' '`

LOCATION_NAMES=`scselect | tail -n +2 | cut -d "(" -f 2 | cut -d ")" -f 1`
CURRENT_LOCATION=`scselect | grep " \* " | cut -d "(" -f 2 | cut -d ")" -f 1`

if echo "$LOCATION_NAMES" | egrep -q "^$SSID$"; then
  NEW_LOCATION="$SSID"
else
  if echo Automatic | grep -q "$LOCATION_NAMES"; then
    NEW_LOCATION=Automatic
  elif echo auto | grep -q "$LOCATION_NAMES"; then
    NEW_LOCATION=auto
  else
    echo "Automatic location was not found!"
    echo "The following locations are known:"
    echo "$LOCATION_NAMES"
  fi
fi
echo ssid $SSID
echo new $NEW_LOCATION
echo cur $CURRENT_LOCATION

if [ "x$NEW_LOCATION" != "x" -a "x$NEW_LOCATION" != "x$CURRENT_LOCATION" ]; then
    echo "Changing to $NEW_LOCATION"
    scselect "$NEW_LOCATION"
    echo "complete"
else
    echo "No change. Current location ==> $CURRENT_LOCATION"
fi
echo  "$NEW_LOCATION"

```