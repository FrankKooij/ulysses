#!/bin/bash

source="~/Library/Containers/com.soulmen.ulysses3/Data/Documents/Library/Groups-ulgroup/d39f8a6f387244febd68dfee4ff94c5e-ulgroup/b082cfb288c94667be7c0cd44605130c-ulgroup"
temporary="~/DraftControl/temp"
destination="~/DraftControl/documents"

while true
	do
		cp -a $source/* $temporary
		for f in $temporary/*.ulysses; do mv "$f" "${f%.ulysses}"; done
		for f in $temporary/*/; do mv "$f"Text.txt $temporary/$(basename "$f").txt; done
		cp -a $temporary/*.txt $destination
		rm -rf $temporary/*
	sleep 60
done	
	
exit 0
