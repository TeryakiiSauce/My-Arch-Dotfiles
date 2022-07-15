# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=2000
setopt autocd beep notify
bindkey -e
# End of lines configured by zsh-newuser-install

# Custom Aliases
alias rr="cd ~/Documents/GitHub/My-Arch-Dotfiles/"       # cd to my GitHub main repo dir
alias rh="cd ~/Documents/GitHub/My-Arch-Dotfiles/home/"  # cd to my GitHub repo 'home' dir
alias ro="cd ~/Documents/GitHub/My-Arch-Dotfiles/other/" # cd to my GitHub repo 'other' dir
# End of custom aliases

# The following lines were added by compinstall
zstyle :compinstall filename '/home/teryakiisauce/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Other configurations
eval "$(starship init zsh)" # starship terminal prompt
# End of other configurations
