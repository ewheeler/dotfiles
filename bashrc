export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
export EDITOR=vim
stty -echoctl
PS1='\[\033[31;37m\]\h\[[\w]\$ \[\033[0m\]'
export LSCOLORS=DxGxcxdxBxegedabagacad
alias ls='ls -G'
alias rmpyc='find . -name "*.pyc" -exec rm {} \;'
alias bitch,='sudo'
alias datamine='ssh -L 5984:localhost:5984 conductor@datamine.txteagle.com'
