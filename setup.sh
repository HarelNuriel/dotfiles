#!/usr/bin/env bash

apt install -y rofi xserver-xorg xinit x11-xserver-utils bspwm sxhkd feh picom polybar alacritty zsh curl lm-sensors zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf /opt/nvim-linux-x86_64
tar -C /opt -xzf ~/Downloads/nvim-linux-x86_64.tar.gz

sensors-detect

user=${SUDO_USER:-$USER}
git_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
home=/home/$user

bspwm=$home/.config/bspwm
sxhkd=$home/.config/sxhkd
alacritty=$home/.config/alacritty
wallpaper=$home/.config/wallpaper
picom=$home/.config/picom
rofi=$home/.config/rofi

mkdir -p $bspwm
mkdir -p $sxhkd
mkdir -p $alacritty
mkdir -p $wallpaper
mkdir -p $picom
mkdir -p $rofi

rm -f $home/.bashrc
rm -f $home/.xinitrc
rm -f $bspwm/bspwmrc
rm -f $sxhkd/sxhkdrc
rm -f $alacritty/alacritty.toml
rm -f $picom/picom.conf
rm -f $rofi/config.rasi

rm -rf $home/.config/polybar
rm -rf $home/.config/custom-scripts

ln -s $git_dir/bspwmrc $bspwm/bspwmrc
ln -s $git_dir/sxhkdrc $sxhkd/sxhkdrc
ln -s $git_dir/alacritty.toml $alacritty/alacritty.toml
ln -s $git_dir/polybar/ $home/.config
ln -s $git_dir/custom-scripts $home/.config
ln -s $git_dir/picom.conf $picom/picom.conf
ln -s $git_dir/zshrc $home/.zshrc
ln -s $git_dir/zsh_aliases $home/.zsh_aliases
ln -s $git_dir/dircolors $home/.dircolors
ln -s $git_dir/xinitrc $home/.xinitrc
ln -s $git_dir/config.rasi $rofi/config.rasi

chmod +x $git_dir/bspwmrc
chmod +x $git_dir/polybar/launch.sh

for file in "$git_dir/custom-scripts/"*.sh; do
    chmod +x "$file"
done

chown $user:$user -R $home
