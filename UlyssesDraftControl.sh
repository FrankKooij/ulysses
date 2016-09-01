#!/bin/bash

# This bash script for MacOS enables you to use the Draft Control app with the Ulysses app.
# It copies a plain text version of all your sheets from the Ulysses file structure to a temporary directory, which you may add to Draft Control for tracking your edits.
# All plain text sheets carry the same name as their corresponding sheet in the Ulysses file structure, which is a 32 character UUID.
# Sheets that are deleted in Ulysses are not automatically deleted from the temporary tracking directory.
# The script is set to run every 120 seconds.
# Ulysses: https://itunes.apple.com/app/ulysses/id623795237
# Draft Control: https://itunes.apple.com/app/draft-control/id644346785 

source=~/"Library/Containers/com.soulmen.ulysses3/Data/Documents/Library/Groups-ulgroup"
temporary=~/"Ulysses_DraftControl"

while true
	do
		src="$source" tmp="$temporary" find "$source" -depth -name "*.txt" -exec bash -c 'p="$tmp/${1##$src/}" q="${p%/*}"; if [ ! -d "${q%/*}" ]; then mkdir -p "${q%/*}"; fi; cp -a "$1" "${q%*.ulysses}.txt"' _ {} \;
	sleep 120
done	
	
exit 0
