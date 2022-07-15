#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Custom Aliases

# cd to my GitHub repo 'home' dir
alias rh="cd ~/Documents/GitHub/My-Arch-Dotfiles/home/ && echo 'Switched to Repo/home/'"

# cd to my GitHub repo 'other' dir
alias ro="cd ~/Documents/GitHub/My-Arch-Dotfiles/other/ && echo 'Switched to Repo/other/'"

# End of custom aliases