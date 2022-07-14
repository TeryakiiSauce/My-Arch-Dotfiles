# My Arch Dotfiles

All my dotfiles configs are stored here so that I could recreate, reconfigure or install stuff easily next time.

### To avoid annoying directory problems, make sure to save the repo (_'My-Arch-Dotfiles'_ folder) to:

`~/Documents/GitHub/` so it should look like this: `~/Documents/GitHub/My-Arch-Dotfiles/` _Note: Create directories whenever necessary._

## My system info
    * OS: Arch Linux
    * Shell: BASH / ZSH
    * Window Manager: BSPWM
    * Terminal: Alarcritty / Kitty
    * Resolution: 1920 x 1080
    * CPU: AMD R5 3600
    * GPU: AMD RX 5600 XT
    * Memory: 32GB @ 3200MHz

## Installing the required stuff

All my installed packages are found in **[here](other/installed%20packages.txt)**. Use either of the following commands below *(replace `<package-name>` to the desired package to be installed)*:
> `sudo pacman -Syu <package-name>`

OR
   
> `yay -Syu <package-name>`
> * **⚠ Important Note:** To use `yay`, you need to have `yay` installed. Google the instructions it's not very difficult to install.

## How to create links to file for syncing purposes
I have created one guide **[here](home/.config/fontconfig/README.md)**, it can be used to create the links. Just replace the file/ directory names but be careful because some config files have different file names for ***per user*** configs and ***system-wide*** configs.
