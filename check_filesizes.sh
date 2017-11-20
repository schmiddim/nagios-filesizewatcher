#!/bin/bash
#######################################################
#
#@descKeep an eye on a folder an send nagios warnings if a file becomes too large
#@author: Michael Schmitt schmiddim@gmx.at
#######################################################


#Nagio exit codes
#exit 0 OK The plugin was able to check the service and it appeared to be functioning properly
#exit 1 Warning The plugin was able to check the service, but it appeared to be above some "warning" threshold or did not appear to be working properly
#exit 2 Critical The plugin detected that either the service was not running or it was above some "critical" threshold
#exit 3 Unknown

if  [ "$#" -ne 3 ]; then
    echo "usage check_filesizes.sh path to watch, Warning @ n MB, Critical @ n MB";
    exit -1

fi


warning=$(($2 * 1024)) #size in MB
critical=$(($3 * 1024 )) #size in MB

returnCode=0
message="alles nice"

du -a $1*|sort -hr | { while read -r x; do

    size=$( echo "$x" |cut -f 1 )
    name=$( echo "$x" |cut -f 2)


    if [  $size -gt $critical ];then
         message="$name has size of $size kb"
         returnCode=2
         break
    fi

    if [  $size -gt $warning ];then
         message="$name has size of $size kb"
         returnCode=1
         break
    fi

done
echo $message

exit $returnCode
}

