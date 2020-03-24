#!/bin/sh
# name: loop_in
# desc: literally just keeps reading input to the given file, invoking itself

# FILEPATH -> NIL
# output user input to given file
function input_to_file {
	file="$1"
	printf '%s > ' "$file"
	read message
	echo "$message" >> "$OUTFILE"
}

# INVOCATION
# ==================

OUTFILE="$1"
while test 1 -eq 1; do
	input_to_file "$OUTFILE"
done
