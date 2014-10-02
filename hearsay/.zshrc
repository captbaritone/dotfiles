# ssh to my work VM and attach to tmux
alias dev="ssht -R 1234:localhost:22 dev"

# Hearsay specific
alias pr="./lgtm create"
alias manage="./run.sh manage.py --settings=settings.jeldredge"
alias shell="./run.sh manage.py shell --settings=settings.jeldredge --organization=1"
alias logs="tail -f /var/log/fm/jeldredge.log"
alias celery="./scripts/start_celeryd.sh"
alias ship="./lgtm create"

