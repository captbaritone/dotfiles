#!/bin/sh

# stolen from http://wcm1.web.rice.edu/mutt-tips.html
#
# Filters every email I read and adds the from address to my alias file

MESSAGE=$(cat)

NEWALIAS=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk '{$1=""; if (NF == 3) {print "alias" $0;} else if (NF == 2) {print "alias" $0 $0;} else if (NF > 3) {print "alias", tolower($2)"-"tolower($(NF-1)) $0;}}')

if grep -Fq "$NEWALIAS" $HOME/.mutt/alias; then
    :
else
    echo "$NEWALIAS" >> $HOME/.mutt/alias
fi

echo "${MESSAGE}"

