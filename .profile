# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
#
# sh/ksh initialization

# environment variables
ENV=$HOME/.kshrc
LANG=en_US.UTF-8
HISTFILE=$HOME/.ksh_history
PAGER=less
EDITOR="nvim"
GOPATH=/home/daryl/code/go
GOCODE=$GOPATH/src/github.com/darylturner
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:$GOPATH/bin
export ENV PATH HOME TERM LANG EDITOR PAGER
export GOPATH GOCODE

export PS1='\w\n> '

# shell aliases
alias evil="emacsclient -t -a ''"
alias gs="git status"
alias pr="hub pull-request"
alias ls="ls -p"
alias proxy-activate="ssh -fgND 51080 mtp"
alias load-keys="ssh-add .ssh/id_ecdsa .ssh/id_ecdsa_bastion"
alias tmux="tmux -2"

# custom key binds
bind -m '^L'=clear'^J'

# run cmds
task-banner
