#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#nitrogen --restore &
#xrandr -s 1920x1080 -r 144
#xsetroot -cursor_name left_ptr
#setxkbmap us &
#picom --experimental-backend &
#imwheel &
#discord --start-minimized & # This is run here because discord used to open each time I reload bspwm
#lxsession &
#exec bspwm # Runs ~/.config/bspwm/bspwmrc

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

#############################
##                         ##
##      STARTUP STUFF      ##
##                         ##
#############################

nitrogen --restore &
xrandr -s 1920x1080 -r 144
xsetroot -cursor_name left_ptr
picom --experimental-backend &
discord --start-minimized &
xinput --set-prop 8 'libinput Accel Speed' -0.5 &
$HOME/.config/polybar/launch.sh

# display timeout
xset s off &
xset dpms 1800 1800 1800 & # 1800 secs = 30 mins
xautolock -time 30 -locker slock -notify 30 &

# enable numlock
numlockx &

# run steam
steam -silent &

exec bspwm # Runs ~/.config/bspwm/bspwmrc (the config file gets reloaded whenever bspwm is reloaded)

###  [ OTHER (Unused) ]  ###

#lxsession &
#imwheel &
#setxkbmap us &
