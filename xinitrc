#!/bin/bash

#export BROWSER=firefox
#exec ck-launch-session dbus-launch openbox-session
mpd ~/.mpdconf &
nitrogen --restore &
exec ck-launch-session dbus-launch subtle

