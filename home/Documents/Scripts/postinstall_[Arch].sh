#!/bin/bash

user='teryakiisauce' # Edit this value

# Edit the location path of the "My-Arch-Dotfiles" repo dir depending on your case. [Default: ~/Documents/GitHub/My-Arch-Dotfiles/]
repo_dir='/home/'$user'/Documents/GitHub/My-Arch-Dotfiles/'

#echo "Before you run the script make sure to stop & read it if you haven't and edit the repo's dir path in required"
#sleep 5

# INFO: Needs sudo privileges to run properly
if [[ "$EUID" -ne 0 ]]; then
	echo "You need 'sudo' privileges to continue running the script."
	exit
fi

# Installs required software [Proprietary AMD/ NVIDIA GPU drivers not included]
#pacman -Syu --noconfirm && pacman -S --noconfirm alacritty amd-ucode intel-ucode base bspwm discord efibootmgr firefox git gitui htop man-db nano neofetch neovim nitrogen ntfs-3g numlockx openssh papirus-icon-theme pavucontrol pipewire pipewire-pulse polybar ranger reflector rofi rofimoji starship sxhkd trash-cli zsh zsh-syntax-highlighting

# Creating the necessary symbolic links
echo ""
echo "Proceeding to create symbolic links..."

# 1. Home Dir links
rm -rv /home/$user/.zshrc*
cd /home/$user/ && ln -sfv $repo_dir'home/.zshrc' && usermod -s /bin/zsh $user
rm -rv /home/$user/.bashrc*
cd /home/$user/ && ln -sfv $repo_dir'home/.bashrc'
rm -rv /home/$user/.gtkrc-2.0*
cd /home/$user/ && ln -sfv $repo_dir'home/.gtkrc-2.0'
rm -rv /home/$user/.xinitrc*
cd /home/$user/ && ln -sfv $repo_dir'home/.xinitrc'

# 2. Pictures Dir links
cd /home/$user/ && mkdir Pictures/ # create the dir (just in case)
trash-put -fv /home/$user/Pictures/'Anime Wallpapers'*
cd /home/$user/Pictures/ && ln -sfv $repo_dir'home/Pictures/Anime Wallpapers/'
trash-put -fv /home/$user/Pictures/ASCII_art*
cd /home/$user/Pictures/ && ln -sfv $repo_dir'home/Pictures/ASCII_art/'
trash-put -fv /home/$user/Pictures/Unused*
cd /home/$user/Pictures/ && ln -sfv $repo_dir'home/Pictures/Unused/'

# 3. Documents Dir links
cd /home/$user/ && mkdir Documents/ # create the dir (just in case)
trash-put -fv /home/$user/Documents/Scripts*
cd /home/$user/Documents/ && ln -sfv $repo_dir'home/Documents/Scripts/'

# 4. .local Dir links
cd /home/$user/ && mkdir -p .local/share/ # create the dirs (just in case)
rm -rv /home/$user/.local/share/rofimoji*
cd /home/$user/.local/share/ && ln -sfv $repo_dir'home/.local/share/rofimoji/'

# 5. .config Dir links
cd /home/$user/ && mkdir -p .config/ # create the dir (just in case)
# TODO: use for loop instead for an optimized script

# Install yay if not found
if [[ $(which yay) != '/usr/bin/yay' ]]; then
	#echo "[WARNING]: Yay is not installed, script will now proceed to install yay..."
	mkdir -v /yay-install/ # create temp dir to download yay
	git clone https://aur.archlinux.org/yay-git.git /yay-install/
	chown -R $user:$user /yay-install/
	cd /yay-install/
	makepkg -si
	rm -rv /yay-install/
	cd # return to home dir
fi

#echo ""
#echo "[INFO]: Yay AUR helper has been installed for you, sorry I guess?"
#echo ""
#echo "[Done/ Final Step]: Copy/ Paste and run the following command(s):"
#echo "yay -Syu --noconfirm && yay -S --noconfirm betterlockscreen picom-jonaburg-git"
#echo "[OPTIONAL] - sudo pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-nerd-fonts-symbols-2048-em"
#echo ""
#echo "[Note]: Some files might have been moved to trash instead of permenantly deleting them. Use [trash-list] to show the files or [trash-restore] to recover the files."
