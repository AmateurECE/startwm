#!/bin/sh
###############################################################################
# NAME:             startwm.sh
#
# AUTHOR:           Ethan D. Twardy <ethan.twardy@gmail.com>
#
# DESCRIPTION:      Simple wrapping script for starting window managers based
#                   on wlroots.
#
# CREATED:          07/22/2022
#
# LAST EDITED:      11/30/2022
###

export XDG_SESSION_TYPE=wayland

# Start sway if no other shell is specified.
: ${STARTWM_SHELL:=sway}

start_sway() {
    export XDG_SESSION_DESKTOP=sway
    export XDG_CURRENT_DESKTOP=sway
    exec sway
}

start_hyprland() {
    export XDG_SESSION_DESKTOP=hyprland
    export XDG_CURRENT_DESKTOP=hyprland
    exec Hyprland
}

case "$STARTWM_SHELL" in
    sway)
        start_sway
        ;;
    hyprland)
        start_hyprland
        ;;
    *)
        >&2 printf '%s\n' "Unknown window manager $STARTWM_SHELL"
        RC=1
        ;;
esac

###############################################################################
