#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
deepseek() { npx @deepseek-ai/dsh@latest web "$@"; }
alias touchpad-fix='sudo /usr/local/bin/touchpad-restart'
