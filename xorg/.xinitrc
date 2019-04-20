#!/bin/bash

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f ${sysresources} ]; then
    xrdb -merge ${sysresources}
fi

if [ -f ${sysmodmap} ]; then
    xmodmap ${sysmodmap}
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# load additional configs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export LANG="en_US.UTF-8"
#export LC_COLLATE="zh_CN.UTF-8"
export LC_CTYPE="zh_CN.UTF-8"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"
#export TERMINAL=terminator
numlockx &

export XDG_CONFIG_HOME="$HOME/.config"

set QTCREATOR_DISABLE_NATIVE_MENUBAR

#exec gnome-session
exec startkde
#exec i3
#exec bspwm
