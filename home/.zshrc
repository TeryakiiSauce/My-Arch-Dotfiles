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
alias gs="git status"                                                       # show git status
alias ga="git add . && echo \"All changes are now staged.\""                # add/stage all changed items using git
alias gr="git restore --staged . && echo \"All changes are now unstaged.\"" # remove all staged items using git (use `grf` function to remove specfic file(s))
alias gf="git fetch"                                                        # fetch changes using git
alias gp="git push"                                                         # push changes to origin using git
alias gl="git pull"                                                         # pull changes from origin using git
# End of custom aliases

# Custom Functions
gc() {
    # function that acts like an alias to commit git changes
    # PARAM: message
    git commit -m "$1"
    echo "Changes have been committed to origin."
}

grf() {
    # function that acts like an alias to remove specfic file(s) from staged items using git
    # NOTE: There is no autocomplete for this function as of yet, maybe if I can I'll do something about it
    git restore --staged "$@"
    echo "Specified file(s) are now unstaged."
}
# End of custom functions

# The following lines were added by compinstall
zstyle :compinstall filename '/home/teryakiisauce/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Other configurations
eval "$(starship init zsh)" # starship terminal prompt
# End of other configurations
