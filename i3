# set modifier
set $super Mod4
set $alt Mod1

# set font
font pango: Noto Sans 11

#autostart
exec --no-startup-id ~/.scripts/set_wallpaper
exec --no-startup-id compton -b
exec --no-startup-id xautolock -time 10 -locker 'i3exit lock'
exec --no-startup-id setxkbmap -layout es
exec --no-startup-id insync start

# start a terminal
bindsym $super+Return exec urxvt

# start dmenu (a program launcher)
bindsym $super+space exec i3-dmenu-desktop --dmenu="dmenu -i -fn 'Noto Sans:size=10'"

# common apps keybinds
bindsym $super+Shift+l exec lockscreen

# screenshots
bindsym Print exec spectacle

# volume
bindsym XF86AudioRaiseVolume exec amixer -q -D pulse sset Master 5%+; exec pkill -RTMIN+10 i3blocks
bindsym XF86AudioLowerVolume exec amixer -q -D pulse sset Master 5%-; exec pkill -RTMIN+10 i3blocks
bindsym XF86AudioMute exec amixer -q -D pulse sset Master toggle; exec pkill -RTMIN+10

# Num locks
bindsym --release Caps_Lock exec pkill -SIGRTMIN+11 i3blocks
bindsym --release Num_Lock  exec pkill -SIGRTMIN+11 i3blocks

# kill focused window
bindsym $super+q kill

# change focus
bindsym $super+h focus left
bindsym $super+k focus down
bindsym $super+j focus up
bindsym $super+l focus right

# move focused window
bindsym $super+Control+h move left
bindsym $super+Control+k move down
bindsym $super+Control+j move up
bindsym $super+Control+l move right

# split orientation
bindsym $super+Shift+h split h
bindsym $super+Shift+v split v

# change container layout split
bindsym $super+s layout toggle split
bindsym $super+t layout tabbed
bindsym $super+f fullscreen toggle
bindsym $super+m floating toggle

# switch to workspace
bindsym $super+1 workspace 1
bindsym $super+2 workspace 2
bindsym $super+3 workspace 3
bindsym $super+4 workspace 4
bindsym $super+5 workspace 5
bindsym $super+6 workspace 6
bindsym $super+7 workspace 7
bindsym $super+8 workspace 8
bindsym $super+9 workspace 9
bindsym $super+0 workspace 0

# move focused container to workspace
bindsym $super+Shift+1 move container to workspace 1
bindsym $super+Shift+2 move container to workspace 2
bindsym $super+Shift+3 move container to workspace 3
bindsym $super+Shift+4 move container to workspace 4
bindsym $super+Shift+5 move container to workspace 5
bindsym $super+Shift+6 move container to workspace 6
bindsym $super+Shift+7 move container to workspace 7
bindsym $super+Shift+8 move container to workspace 8
bindsym $super+Shift+9 move container to workspace 9
bindsym $super+Shift+0 move container to workspace 0

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $super+Shift+r restart

# exit i3
bindsym $super+Shift+q exec "i3-nagbar -t warning -m 'Shutdown?' -b 'Yes' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        bindsym Left resize shrink width 5 px or 5 ppt
        bindsym Down resize grow height 5 px or 5 ppt
        bindsym Up resize shrink height 5 px or 5 ppt
        bindsym Right resize grow width 5 px or 5 ppt
        bindsym Return mode "default"
	bindsym Escape mode "default"
}
bindsym $super+r mode "resize"

# panel
bar {
    position top
    font pango: Noto Sans 11
	colors {
        background #2f343f
        separator #4b5262
        focused_workspace	#2f343f	#bf616a	#d8dee8
        active_workspace	#2f343f	#2f343f	#d8dee8
        inactive_workspace	#2f343f	#2f343f	#d8dee8
        urgent_workspace	#2f343f	#ebcb8b	#2f343f
    }
        status_command i3blocks
}

set $mode_system System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown
mode "$mode_system" {
    bindsym l exec --no-startup-id i3exit lock, mode "default"
    bindsym e exec --no-startup-id i3exit logout, mode "default"
    bindsym s exec --no-startup-id i3exit suspend, mode "default"
    bindsym h exec --no-startup-id i3exit hibernate, mode "default"
    bindsym r exec --no-startup-id i3exit reboot, mode "default"
    bindsym Shift+s exec --no-startup-id i3exit shutdown, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $super+Shift+p mode "$mode_system"

# colour of border, background, text, indicator, and child_border
client.focused			#bf616a #2f343f #d8dee8 #bf616a #d8dee8
client.focused_inactive		#2f343f #2f343f #d8dee8 #2f343f #2f343f
client.unfocused		#2f343f #2f343f #d8dee8 #2f343f #2f343f
client.urgent			#2f343f #2f343f #d8dee8 #2f343f #2f343f
client.placeholder		#2f343f #2f343f #d8dee8 #2f343f #2f343f
client.background		#2f343f

hide_edge_borders smart
workspace_auto_back_and_forth yes
force_display_urgency_hint 500 ms
