#!/bin/sh
# name:	diff_notify.sh
# desc:	monitor a file for changes; then notify the user when it changes
# 	by default it makes your PC beep a couple times
# lisc: cc0

# FILEPATH -> SHA256_HASH
# get a file's hash, using the proper program
function file_hash {
	local file="$1"
	local hash="$(sha256sum "$file" 2>/dev/null | awk '{print $1}' 2>/dev/null)"
	if test -z "$hash"; then
    		hash="$(sha256 -q "$file" 2>/dev/null)"
    	fi
	echo "$hash"
}

# NIL -> NIL
# beeps even on systems without the beep command
function true_beep {
	if beep 2>/dev/null; then printf '\007\n'; fi
}

# FILEPATH -> NIL
# monitor a file for changes 'till death, notify the user when it changes
function monitor_file {
    	local file="$1"
    	local old_hash="$(file_hash "$file")"
    	local new_hash="$old_hash"
	echo "monitoring $file"
	while test 1 -eq 1; do
    		old_hash="$new_hash"
    		new_hash="$(file_hash "$file")"
    		if test "$old_hash" != "$new_hash"; then
        		notify "$file" "$(tail -1 "$file")"
		fi
		sleep 5
	done
}

# HEADER MESSAGE -> ??
# notify the user *somehow*-- depending on what's uncommented
function notify {
	local header="$1"
	local message="$2"
	## As you can tell, there are a bunch of ways to be notified. =w=
	# notify-send "$header" "$message"
	# zenity --notification --text="$header"
	# mpv ~/.notification.ogg
	true_beep; true_beep
}

# INVOCATION
# ==================
FILE="$1"
monitor_file "$FILE"
