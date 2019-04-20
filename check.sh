#!/usr/bin/sh

all_files=()
for d in `find . -maxdepth 1 -not \( -path "./.git" -prune \) -a -type d -not -name .`; do
    for f in `find $d -type f`; do
        all_files+=("$f")
    done
done

exit_code=0

for f in ${all_files[@]}; do
    result=`grep --color=always -f sensitive.txt -i -I $f`
    if [ $? = 0 ]; then
        exit_code=$((exit_code+1))
        echo -e "In file \e[93m$f\e[39m:"
        echo -e "$result"
    fi
done

exit $exit_code

# vim: set et ts=4 sw=4 :
