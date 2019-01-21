#!/bin/sh

while read line
do
	oldUrl="$( echo $line | cut -d',' -f1 )"
	newUrl="$( echo $line | cut -d' ' -f2 )"

	#echo $oldUrl
	#echo $newUrl

	result="$( curl -sS -I -L $oldUrl )"
	#echo "$result"

	echo "$result" | /bin/egrep "^HTTP/1.1 302 Found[[:cntrl:]]*$" > /dev/null 2> /dev/null || echo "ERROR: old URL '$oldUrl' not redirected !"
	redirect="$( echo "'$result'" | /bin/egrep '^Location: ' )"
	#echo $redirect
	echo "$redirect" | /bin/egrep "^Location: $newUrl[[:cntrl:]]*$" > /dev/null 2> /dev/null || echo "   ERROR: old URL '$oldUrl' not redirected to '$newUrl' but to '$( echo $redirect | cut -d' ' -f2 )' !"
	echo "$result" | /bin/egrep "^HTTP/1.1 200 OK[[:cntrl:]]*$" > /dev/null || echo "ERROR: no valid page found for old URL '$oldUrl' !"

	echo "INFO: done $oldUrl => $newUrl"

done < ./tous_les_liens.txt
