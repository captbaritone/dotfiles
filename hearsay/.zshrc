HEARSAY_USERNAME='jeldredge'
HEARSAY_SETTINGS="settings.$HEARSAY_USERNAME"
HEARSAY_LABS_PATH="$HOME/projects/HearsayLabs"
HEARSAY_LABS_FANMGMT_PATH="$HEARSAY_LABS_PATH/fanmgmt"
HEARSAY_LABS_ORG="1"

export LGTMEDITOR=True

# ssh to my work VM and attach to tmux
alias dev="ssht -R 1234:localhost:22 dev"

alias fan="cd $HEARSAY_LABS_FANMGMT_PATH"
alias manage="fan && $HEARSAY_LABS_FANMGMT_PATH/run.sh manage.py --settings=$HEARSAY_SETTINGS"
alias shell="fan && $HEARSAY_LABS_FANMGMT_PATH/run.sh manage.py shell --settings=$HEARSAY_SETTINGS --organization=$HEARSAY_LABS_ORG"
alias logs="tail -f /var/log/fm/$HEARSAY_USERNAME.log"
alias celery="fan && $HEARSAY_LABS_FANMGMT_PATH/scripts/start_celeryd.sh"
alias ship="fan && lgtm create"
alias fix="sudo service uwsgi restart && sudo service nginx restart"
