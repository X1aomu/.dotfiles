# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !
#
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
    # Shell is non-interactive.  Be done now!
    return
fi

# fzf
# ------------
if `which fzf > /dev/null`; then
    source "/usr/share/fzf/completion.bash"
    source "/usr/share/fzf/key-bindings.bash"
elif [ -d ~/.fzf ]; then
    if [[ ! "$PATH" == "*$HOME/.fzf/bin*" ]]; then
        export PATH="$PATH:$HOME/.fzf/bin"
    fi
    source "$HOME/.fzf/shell/completion.bash" 2> /dev/null
    source "$HOME/.fzf/shell/key-bindings.bash"
fi

# vim: set et ts=4 sw=2 :
