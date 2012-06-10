#!/bin/bash
# Autocommit script - pushes your todo file to a git repository and pulls any
# updates.
#
# Add it to cron to run every minute (or 5 minutes if desired)
#

MYDIR=`dirname $0`

[[ -f $MYDIR/autocommit.cfg ]] && . $MYDIR/autocommit.cfg

# Debugging functions
if [[ "$1" == "-x" ]]; then
    DEBUG=yes
else
    DEBUG=no
fi

debugmsg() {
    if [[ "$DEBUG" == "yes" ]]; then
        echo "$@"
    fi
    echo "$@" >> $LOGFILE
}

CURRTIME=`date +%s`
COMMIT=no
PINGCMD="ping -q -n -W 1 -c 1 $PINGHOST"
NETWORKUP=no

cd $MYDIR
debugmsg "==================================================================="
debugmsg "Running $0 - `date`"
debugmsg "==================================================================="

debugmsg "In: $PWD"
debugmsg "Currtime: $CURRTIME"

debugmsg "Files:"
for f in $FILES; do
    MODTIME=`stat -c %Y $f`
    debugmsg -n "    $f - $MODTIME - "
    # If the file wasn't modified in the last $SECONDS seconds, then add it to
    # be committed
    if [[ "($CURRTIME - $SECONDS)" -gt "$MODTIME" ]]; then
        debugmsg "adding"
        $GIT add $f > /dev/null
    else
        debugmsg "not adding: recently modified"
    fi
done

if TESTNET=yes; then
    debugmsg -n "Testing for network connectivity - "
    if $PINGCMD > /dev/null 2>&1; then
        debugmsg "UP"
        NETWORKUP=yes
    else
        debugmsg "DOWN"
        NETWORKUP=no
    fi
else
    debugmsg "Not testing for network connectivity - assuming it is up"
    NETWORKUP=yes
fi

if $GIT status > /dev/null; then
    debugmsg "We have changed files - committing"
    $GIT commit -m "$MESSAGE" >> $LOGFILE
fi

if [[ "$PUSH" == "yes" ]]; then
    debugmsg -n "Try to push - "
    if [[ "$NETWORKUP" == "yes" ]]; then
        if ! $GIT diff --quiet $BRANCH..$REMOTE/$BRANCH; then
            debugmsg "Pushing"
            $GIT push --porcelain $REMOTE $BRANCH >> $LOGFILE 2>&1
        else
            debugmsg "Nothing to push"
        fi
    else
        debugmsg "Network down"
    fi
fi

if [[ "$PULL" == "yes" ]]; then
    debugmsg -n "Try to pull - "
    if [[ "$NETWORKUP" == "yes" ]]; then
        debugmsg "pulling"
        $GIT pull $REMOTE $BRANCH >> $LOGFILE 2>&1
    else
        debugmsg "Network down"
    fi
fi
