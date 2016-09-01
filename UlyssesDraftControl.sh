#!/bin/bash

source=~/"Library/Containers/com.soulmen.ulysses3/Data/Documents/Library/Groups-ulgroup"
temporary=~/"Ulysses_DraftControl"

while true
	do
		src="$source" tmp="$temporary" find "$source" -depth -name "*.txt" -exec bash -c 'p="$tmp/${1##$src/}" q="${p%/*}"; if [ ! -d "${q%/*}" ]; then mkdir -p "${q%/*}"; fi; cp -a "$1" "${q%*.ulysses}.txt"' _ {} \;
	sleep 150
done	
	
exit 0
