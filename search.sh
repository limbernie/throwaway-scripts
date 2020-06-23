#!/bin/bash

EXTN=$@

for extn in $EXTN; do
    NAME=$(curl -s \
                -L \
                http://chrome.google.com/webstore/detail/$extn \
           | grep -Eo '<title>.*<\/title>' \
           | sed -r 's/<\/?title>//g' \
           | sed -r 's/ - Chrome Web Store$//')
    if grep -E 404 <<<"$NAME" &>/dev/null; then
        NAME="*** Not Found ***"
    fi
    printf "%s: %s\n" "$extn" "$NAME"
done
