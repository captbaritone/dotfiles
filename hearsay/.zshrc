HEARSAY_USERNAME='jeldredge'
HEARSAY_SETTINGS="settings.$HEARSAY_USERNAME"
HEARSAY_LABS_PATH="$HOME/projects/HearsayLabs"
HEARSAY_LABS_FANMGMT_PATH="$HEARSAY_LABS_PATH/fanmgmt"
HEARSAY_LABS_ORG="1"

# ssh to my work VM and attach to tmux
alias dev="ssht -R 1234:localhost:22 dev"

alias manage="$HEARSAY_LABS_FANMGMT_PATH/run.sh manage.py --settings=$HEARSAY_SETTINGS"
alias shell="$HEARSAY_LABS_FANMGMT_PATH/run.sh manage.py shell --settings=$HEARSAY_SETTINGS --organization=$HEARSAY_LABS_ORG"
alias logs="tail -f /var/log/fm/$HEARSAY_USERNAME.log"
alias celery="$HEARSAY_LABS_FANMGMT_PATH/scripts/start_celeryd.sh"
alias ship="cd $HEARSAY_LABS_FANMGMT_PATH && ./lgtm create"
alias fix="sudo service uwsgi restart && sudo service nginx restart"
alias fan="cd $HEARSAY_LABS_FANMGMT_PATH"
alias revert="$HEARSAY_LABS_FANMGMT_PATH/lgtm revert"
alias chef="sudo chef-client"

revert() { $HEARSAY_LABS_FANMGMT_PATH/lgtm revert $1 }
unrevert() { ./lgtm revert $1 --no-push }

start() {
    git fetch upstream
    git checkout -b workflow-"$*" upstream/master
}

work() {
    git checkout workflow-"$*"
}
