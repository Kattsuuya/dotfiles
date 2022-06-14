#!/usr/bin/env bash

. "$DOTPATH/bin/install.sh"

for i in $DOTPATH/bin/scripts/*.sh
do
    if [ -f "$i" ]; then
        log_info "$(e_arrow "$(basename "$i")")"
        if [ "${DEBUG:-}" != 1 ]; then
            bash "$i"
        fi
    else
        continue
    fi
done
