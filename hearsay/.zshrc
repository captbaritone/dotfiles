HEARSAY_USERNAME='jeldredge'
HEARSAY_SETTINGS="settings.$HEARSAY_USERNAME"
HEARSAY_LABS_PATH="$HOME/projects/HearsayLabs"
HEARSAY_LABS_ORG="1"

# ssh to my work VM and attach to tmux
alias dev="ssht -R 1234:localhost:22 dev"

alias pr="./lgtm create"
alias manage="./run.sh manage.py --settings=$HEARSAY_SETTINGS"
alias shell="./run.sh manage.py shell --settings=$HEARSAY_SETTINGS --organization=$HEARSAY_LABS_ORG"
alias logs="tail -f /var/log/fm/$HEARSAY_USERNAME.log"
alias celery="./scripts/start_celeryd.sh"
alias ship="./lgtm create"
alias fix="sudo service uwsgi restart && sudo service nginx restart"

start() {
    git checkout -b workflow-"$*" upstream/master
}
