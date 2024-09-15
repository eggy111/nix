#!/usr/bin/env bash

#Modified version of the randomize script by swww to not require passing an input


DEFAULT_DIR="/home/eggy/Documents/nix/hm/wallpapers"
DIR="${1:-$DEFAULT_DIR}"
if [[ ! -d $DIR ]]; then
	echo "Directory not found: $DIR"
	exit 1
fi

export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=2

INTERVAL=300

while true; do
    find "$DIR" -type f \
	    | while read -r img; do
    		echo "$((RANDOM % 1000)):$img"
	    done \
	    | sort -n | cut -d':' -f2- \
	    | while read -r img; do
	        swww img "$img"
		sleep $INTERVAL
	done
done
