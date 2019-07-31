#!/bin/sh

all_packages=`find . -maxdepth 1 -not \( -path "./.git" -prune \) -type d -not -name . | sed 's|^\./||'`
dryrun=""
verbose="-v"
use_all=0

OPTIND=1 # Reset in case getopts has been used previously in the shell.
while getopts "nV" opt; do
    case "$opt" in
        n)
            dryrun="-n"
            ;;
        V)
            verbose=""
            ;;
    esac
done
shift $((OPTIND-1))
stow="stow --dotfiles $verbose $dryrun"

if [ -z $@ ]; then
    use_all=1
fi

if [ $use_all = 1 ]; then
    $stow $all_packages
else
    $stow $@
fi

# vim: set et ts=4 sw=4 :
