#!/bin/bash

#export BROWSER=firefox-aurora
#export DE=xfce
#exec ck-launch-session dbus-launch openbox-session
mpd ~/.mpdconf &
nitrogen --restore &
exec ck-launch-session dbus-launch subtle

