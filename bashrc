#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias c99='gcc -O -Wall -W -pedantic -ansi -std=c99'
alias c89='gcc -O -Wall -W -pedantic -ansi -std=c89'
PS1='[\e[0;34m\u@\h\e[m \e[0;37m\W\e[m]\$ '
