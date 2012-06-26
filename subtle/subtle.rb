#
# Author::  Christoph Kappel <unexist@dorfelite.net>
# Version:: $Id: data/subtle.rb,v 2978 2011/08/02 11:16:25 unexist $
# License:: GNU GPLv2

begin
   require "/home/conor/.config/subtle/contrib/launcher.rb"

   Subtle::Contrib::Launcher.fonts = [
    "xft:DejaVu Sans Mono:pixelsize=80:antialias=true",
    "xft:DejaVu Sans Mono:pixelsize=20:antialias=true"
 ]
   rescue LoadError => error
    puts error
end

begin
    require "/home/conor/.config/subtle/contrib/selector.rb"
   rescue LoadError => error
    puts error
end

# Window move/resize steps in pixel per keypress
set :step, 5

# Window screen border snapping
set :snap, 10

# Default starting gravity for windows. Comment out to use gravity of
# currently active client
set :gravity, :center

# Make transient windows urgent
set :urgent, false

# Honor resize size hints globally
set :resize, false

# Enable gravity tiling
set :tiling, false

# Set the WM_NAME of subtle (Java quirk)
# set :wmname, "LG3D"

#
# == Screen
#

screen 1 do
subtle = Subtlext::Icon.new("/home/conor/.icons/subtle/subtle1.xbm")
  top    [ :views, :betternotify, :spacer, :weather_mod, :separator, :clock, :separator, :battery, :separator, subtle ]
  bottom [ :mpd, :volume, :spacer, :nettraffic, :separator, :wifi, :separator, :title, :tray ] 
end 


#
# == Styles

# Style for all style elements
style :all do
  background  "#202020"
  border      "#303030", 0
  padding     0, 3
  font "-*-*-medium-*-*-*-14-*-*-*-*-*-*-*"
end

# Style for the views
style :views do
foreground  "#757575"

  # Style for the active views
  style :focus do
    foreground  "#66a9b9"
  end

  # Style for urgent window titles and views
  style :urgent do
    foreground  "#ff9800"
  end

  # Style for occupied views (views with clients)
  style :occupied do
    foreground  "#b8b8b8"
  end
end

# Style for sublets
style :sublets do
  foreground  "#757575"
end

# Style for separator
style :separator do
  foreground  "#757575"
  seperator "::"
end

# Style for focus window title
style :title do
  foreground  "#66a9b9"
end

# Style for active/inactive windows
style :clients do
  active      "#303030", 2
  inactive    "#3a3a3a", 2
  margin      0
  width       50
end

# Style for subtle
style :subtle do
  margin      0, 0, 0, 0
  panel       "#202020"
  stipple     "#757575"
end

#
# == Gravities
#

# Top left
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]

# Top
gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]

# Top right
gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  33 ]

# Left
gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]

# Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  33,  33 ]

# Right
gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  67,  50,  33, 100 ]

# Bottom left
gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  67,  50,  33 ]

# Bottom
gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]

# Bottom right
gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  67,  50,  33 ]

# Gimp
#gravity :gimp_image,     [  10,   0,  80, 100 ]
#gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
#gravity :gimp_dock,      [  90,   0,  10, 100 ]

#
# == Grabs
#
# ==== Mouse buttons
#
# [*B1*] = Button1 (Left mouse button)
# [*B2*] = Button2 (Middle mouse button)
# [*B3*] = Button3 (Right mouse button)
# [*B4*] = Button4 (Mouse wheel up)
# [*B5*] = Button5 (Mouse wheel down)
#
# ==== Modifiers
#
# [*A*] = Alt key
# [*C*] = Control key
# [*M*] = Meta key
# [*S*] = Shift key
# [*W*] = Super (Windows) key


# Jump to view1, view2, ...
grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4
grab "W-S-5", :ViewJump5
grab "W-S-6", :ViewJump6

# Switch current view
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4
grab "W-5", :ViewSwitch5
grab "W-6", :ViewSwitch6

# Select next and prev view */
grab "KP_Add",      :ViewNext
grab "KP_Subtract", :ViewPrev

# Move mouse to screen1, screen2, ...
#grab "W-A-1", :ScreenJump1
#grab "W-A-2", :ScreenJump2
#grab "W-A-3", :ScreenJump3
#grab "W-A-4", :ScreenJump4

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-S-r", :SubtleRestart

# Quit subtle
grab "W-C-q", :SubtleQuit

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "A-f", :WindowFloat

# Toggle fullscreen mode of window
grab "W-space", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "W-s", :WindowStick

# Toggle zaphod mode of window (will span across all screens)
grab "W-equal", :WindowZaphod

# Raise window
grab "W-r", :WindowRaise

# Lower window
grab "W-l", :WindowLower

# Select next windows
grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight

# Kill current window
grab "A-q", :WindowKill

# Cycle between given gravities
#grab "W-KP_7", [ :top_left,     :top_left66,     :top_left33     ]
#grab "W-KP_8", [ :top,          :top66,          :top33          ]
#grab "W-KP_9", [ :top_right,    :top_right66,    :top_right33    ]
#grab "W-KP_4", [ :left,         :left66,         :left33         ]
#grab "W-KP_5", [ :center,       :center66,       :center33       ]
#grab "W-KP_6", [ :right,        :right66,        :right33        ]
#grab "W-KP_1", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
#grab "W-KP_2", [ :bottom,       :bottom66,       :bottom33       ]
#grab "W-KP_3", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# In case no numpad is available e.g. on notebooks
grab "W-A-1", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-A-2", [ :top,          :top66,          :top33          ]
grab "W-A-7", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-A-4", [ :left,         :left66,         :left33         ]
grab "W-A-5", [ :center,       :center66,       :center33       ]
grab "W-A-6", [ :right,        :right66,        :right33        ]
grab "W-A-3", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-A-8", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-A-9", [ :bottom_right, :bottom_right66, :bottom_right33 ]
#
# QUERTZ
#grab "W-y", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
#
# QWERTY
#grab "W-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
#
#grab "W-x", [ :bottom,       :bottom66,       :bottom33       ]
#grab "W-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# Exec programs
grab "W-Return", "urxvt"
grab "W-w", "firefox"
grab "A-c", "chromium"
grab "W-p", "pcmanfm"
grab "W-b", "nitrogen"
grab "W-e", "leafpad"
grab "C-q", "oblogout"
grab "A-s", "spacefm"
grab "W-c", "mcomix"
grab "W-n", "urxvt -name ncmpcpp -e ncmpcpp"
grab "C-r", "urxvt -name ranger -e ranger"
grab "W-m", "urxvt -name mutt -e mutt"
grab "W-a", "urxvt -name alpine -e alpine"
grab "A-l", "urxvt -name lynx -e lynx"
grab "W-x", "xfburn"

grab "C-l" do Subtle::Contrib::Launcher.run end

grab "A-s" do Subtle::Contrib::Selector.run  end

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

#
# == Tags
#
#

# Simple tags
tag "terms",   "xterm|[u]?rxvt|terminator"
tag "browser", "firefox|chromium"
tag "filemanager", "pcmanfm|xarchiver|spacefm"
tag "reader", "evince|leafpad"
tag "media", "deadbeef|vlc"

# Placement
tag "editor" do
  match  "leafpad|gvim"
  resize true
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

tag "resize" do
  match  "sakura"
  resize true
end

tag "gravity" do
  gravity :center
end

# Modes
tag "stick" do
  match "mplayer"
  float true
  stick true
end

tag "float" do
  match "display"
  float true
end

tag "term" do
  match "dzen2"
  type  :dock
end

# Gimp
#tag "gimp_image" do
#  match   :role => "gimp-image-window"
#  gravity :gimp_image
#end

#tag "gimp_toolbox" do
#  match   :role => "gimp-toolbox$"
#  gravity :gimp_toolbox
#end

#tag "gimp_dock" do
#  match   :role => "gimp-dock"
#  gravity :gimp_dock
#end

#
# == Views
#

iconpath = "/home/conor/.icons/subtle"

view "term" do
   match "terms"
   icon_only true
   icon   Subtlext::Icon.new("#{iconpath}/term.xbm")
end

view "web" do
   match "browser"
   icon_only true
   icon   Subtlext::Icon.new("#{iconpath}/world.xbm")
end

view "edit" do
   match "edit"
   icon_only true
   icon   Subtlext::Icon.new("#{iconpath}/pencil.xbm")
end

view "media" do
   match "media"
   icon_only true
   icon   Subtlext::Icon.new("#{iconpath}/tv.xbm")
end

view "file" do
   match "filemanager"
   icon_only true
   icon   Subtlext::Icon.new("#{iconpath}/file.xbm")
end

view "arch" do
   match "default"
   icon_only true
   icon   Subtlext::Icon.new("#{iconpath}/arch.xbm")
end

#view "gimp" do
#   match "gimp"
#end

on :start do
   Subtlext::Subtle.spawn "nm-applet"
end

#
# == Sublets
#
sublet :clock do
  interval 30
  format_string "%a %d %B %H:%M"
end

sublet :weather_mod do
  interval 7200
  locale "en"
  units "c"
  location "Belfast"
  day_color "#D23D3D"
  temp_color "#66a9b9"
  sep "-"
  temp_suffix 'c'
end 

sublet :battery do
  colors 10 => "#FF0000", 20 => "#399bff", 100 => "#33cc00"
end 
