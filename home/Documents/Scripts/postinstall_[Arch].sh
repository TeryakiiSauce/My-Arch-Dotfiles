#!/bin/bash

# Edit the following values according to your case
user='teryakiisauce' # Your Home Dir username
home_dir=/home/$user
repo_dir=$home_dir/Documents/GitHub/My-Arch-Dotfiles # The path of "My-Arch-Dotfiles" repo

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
homeDirContents=(".zshrc" ".bashrc" ".gtkrc-2.0" ".xinitrc")
for content in ${homeDirContents[@]}; do
	rm -rv $home_dir/$content*
	ln -sfv $repo_dir/home/$content $home_dir/$content
	chown -R $user:$user $home_dir/$content
done

# 2. Pictures Dir links
mkdir $home_dir/Pictures # create the directory just in case
picsDirContents=("Anime_Wallpapers" "ASCII_art" "Unused")
for content in ${picsDirContents[@]}; do
	trash-put -fv $home_dir/Pictures/$content*
	ln -sfv $repo_dir/home/Pictures/$content $home_dir/Pictures/$content
	chown -R $user:$user $home_dir/Pictures/$content
done

# 3. Documents Dir links
mkdir $home_dir/Documents # create the directory just in case
docsDirContents=("Scripts")
for content in ${docsDirContents[@]}; do
	trash-put -fv $home_dir/Documents/$content*
	ln -sfv $repo_dir/home/Documents/$content $home_dir/Documents/$content
	chown -R $user:$user $home_dir/Documents/$content
done

# 4. .local Dir links
mkdir -p $home_dir/.local/share # create the directory just in case
loc_shareDirContents=("rofimoji")
for content in ${loc_shareDirContents[@]}; do
	rm -rv $home_dir/.local/share/$content*
	ln -sfv $repo_dir/home/.local/share/$content $home_dir/.local/share/$content
	chown -R $user:$user $home_dir/.local/share/$content
done

# 5. .config Dir links
mkdir -p $home_dir/.config # create the directory just in case
configDirContents=("alacritty" "bspwm" "fontconfig" "gtk-2.0" "gtk3.0" "htop" "neofetch" "nitrogen" "openrazer" "picom" "polybar" "polychromatic" "ranger" "rofi" "sxhkd" "betterlockscreen" "currentwm" "starship.toml")
for content in ${configDirContents[@]}; do
	rm -rv $home_dir/.config/$content*
	ln -sfv $repo_dir/home/.config/$content $home_dir/.config/$content
	chown -R $user:$user $home_dir/.config/$content
done

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
#echo "[Note]: Some files might have been moved to trash instead of permenantly deleting them. Use [sudo trash-list] to show the files or [sudo trash-restore] to recover the files."
