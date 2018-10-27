#!/bin/bash

pageUrl="$1"
tempFile="foo"
archiveFile="wiki_archive.txt"

echo "$pageUrl" | grep "?" > /dev/null && pageUrl="$pageUrl&action=edit" || pageUrl="$pageUrl?action=edit"

echo -e "\nWill download mediawiki document at $pageUrl ..."

#curl "$pageUrl" | sed -r -e 's|.*<textarea[^>]*>([^<]*)</textarea>.*|\1|g'

while ! curl "$pageUrl" > $tempFile
do
sleep 3
done

#cat foo | sed -r -e 's|.*<textarea[^>]*>([^<]*)</textarea>.*|\1|g' > foo.wikimedia
#cat foo | sed -r -e 's|.*<textarea([^<]*)</textarea>.*|\1|g' > foo.wikimedia

startLine=$( grep -n "<textarea" $tempFile || echo "0:" )
endLine=$( grep -n "</textarea>" $tempFile || echo "0:" )

startLine=$( echo $startLine | cut -d':' -f1 )
endLine=$( echo $endLine | cut -d':' -f1 )

echo "Start line: $startLine ; End line: $endLine"

head -$endLine $tempFile | tail -n+$startLine | sed -re 's/.*<textarea[^>]*>//g' -e 's/<\/textarea>.*//g' > ${tempFile}.wikimedia

echo "#####Title" >> $archiveFile
echo "$pageUrl" >> $archiveFile
echo "#####Body" >> $archiveFile
cat ${tempFile}.wikimedia >> $archiveFile
echo "#####End" >> $archiveFile

