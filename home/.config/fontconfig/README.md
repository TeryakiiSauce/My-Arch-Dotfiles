## Guide: Syncing the repo's files with the local system's files:

> *Note:* I will be changing directories frequently so that the commands are easier to read. Make sure you do the same as well & also change/ create directories depending on your case, duh!
>> *Another note:* I will be using ***soft/ symbolic links***; you can use hard links if you wish... just remove the _`'s'`_ from _`'ln -vs'`_.

The guide can be used for other stuff that are not related to the font configs but in this case I'll be using the *fontconfig* folder as an example.

### Per User Configs
- *Per User* configs are all located in the `home` folder in the repo. \[[here](/home/)\]

Create a Soft/ Symbolic link for a linked folder in `~/.config/` named `fontconfig/` that points to the following folder in the repo: `/home/.config/fontconfig/`.

> `cd ~/.config/`  
> `ln -vs ~/Documents/GitHub/My-Arch-Dotfiles/home/.config/fontconfig/`

### Global Config
- *Global* configs are all located in the `other` folder in the repo. \[[here](/other/)\]

Create a Soft/ Symbolic link for a linked folder in `/etc/` named `fonts/` that points to the following folder in the repo: `/other/etc/fonts/`.

> `cd /etc/`  
> `sudo ln -vs ~/Documents/GitHub/My-Arch-Dotfiles/other/etc/fonts/`

Then, it is recommended to link a new file in `other/etc/fonts/` named `local.conf` that points to the following folder in the repo: `/home/fontconfig/fonts.conf` (you can copy this file instead as well but they will not be in sync; meaning, you'll have to edit both files manually. One for *per user* and another for *global*).

> `cd ~/Documents/GitHub/My-Arch-Dotfiles/other/etc/fonts/`
> `sudo ln -vs ~/Documents/GitHub/My-Arch-Dotfiles/home/.config/fontconfig/fonts.conf local.conf`

*Note: The linked file is renamed to `local.conf` as the `fonts.conf` file in `/etc/fonts/` will get overwritten whenever fonts are updated.*
