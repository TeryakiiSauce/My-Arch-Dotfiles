## Do the following steps to sync the repo's files with the machine's files:

> Note: I will be changing directories frequently so that the commands are easier to read. Make sure you do so as well & also change the directories depending on your case, duh!
>
> > Another note: I will be using soft/ symbolic links; you can use hard links if you wish to... just remove the _'s'_ from _'ln -vs'_.

### Per User Config

Create a Soft/ Symbolic link to create a linked file in _'~/.config/fontconfig/fonts.conf'_ that points to the _'fonts.conf'_ file in this location of the repo.

> `cd ~/.config/fontconfig/`  
> `ln -vs ~/Documents/GitHub/My-Arch-Dotfiles/home/.config/fontconfig/fonts.conf`

### Global Config

Create a Soft/ Symbolic link to create a linked file in _'/etc/fonts/local.conf'_ that points to the _'fonts.conf'_ file in this location of the repo. Note: Rename the file to _'local.conf'_.

> `cd /etc/fonts/`  
> `sudo ln -vs ~/Documents/GitHub/My-Arch-Dotfiles/home/.config/fontconfig/fonts.conf local.conf`
