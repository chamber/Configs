#!/bin/bash

#export BROWSER=firefox
#exec ck-launch-session dbus-launch openbox-session
xbindkeys &
mpd ~/.mpdconf &
nitrogen --restore &
exec dbus-launch subtle
