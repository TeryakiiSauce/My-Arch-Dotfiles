# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=2000
setopt autocd beep notify
bindkey -e
# End of lines configured by zsh-newuser-install

# Custom Aliases

# cd to my GitHub repo 'home' dir
alias rh="cd ~/Documents/GitHub/My-Arch-Dotfiles/home/ && echo 'Switched to Repo/home/'"

# cd to my GitHub repo 'other' dir
alias ro="cd ~/Documents/GitHub/My-Arch-Dotfiles/other/ && echo 'Switched to Repo/other/'"

# End of custom aliases

# The following lines were added by compinstall
zstyle :compinstall filename '/home/teryakiisauce/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
