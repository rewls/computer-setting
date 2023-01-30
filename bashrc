#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\e[0;34m\u@\h\e[m \e[0;37m\W\e[m]\$ '
