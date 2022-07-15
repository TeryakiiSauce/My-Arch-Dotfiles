#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Custom Aliases
alias rr="cd ~/Documents/GitHub/My-Arch-Dotfiles/"       # cd to my GitHub main repo dir
alias rh="cd ~/Documents/GitHub/My-Arch-Dotfiles/home/"  # cd to my GitHub repo 'home' dir
alias ro="cd ~/Documents/GitHub/My-Arch-Dotfiles/other/" # cd to my GitHub repo 'other' dir
# End of custom aliases

# Other configurations
eval "$(starship init bash)" # starship terminal prompt
# End of other configurations
