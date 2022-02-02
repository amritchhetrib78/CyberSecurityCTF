#!/bin/sh

# Accounts Monitor by Dave Taylo
# Updated by : Amrit Chhetri, Rosefinch

secretcopy="$HOME/.watchdb"
tempfile="$HOME/.watchdb.new"
passwd="/etc/passwd"
compare=0               # by default, don't compare

trap "/bin/rm -f $tempfile" 0

if [ -s "$secretcopy" ] ; then
  lastrev="$(cat $secretcopy)"
  compare=1
fi

cat $passwd | cut -d: -f1 > $tempfile

current="$(cat $tempfile)"

if [ $compare -eq 1 ] ; then
  if [ "$current" != "$lastrev" ] ; then
    echo "WARNING: password file has changed"
    diff $secretcopy $tempfile | grep '^[<>]' |
        sed 's/</Removed: /;s/>/Added:/'
  fi
else
   mv $tempfile $secretcopy
fi

exit 0