#!/bin/bash

sudo apt update && sudo apt -y upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.scripts
sudo chmod -R 755 ~/.scripts

sudo chown -R $(logname):$(logname) /home/$(logname)/
find ~/Bullseye_XFCE -type d -exec chmod 755 {} \;
find ~/Bullseye_XFCE -type f -exec chmod 755 {} \;

#sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free
cd ~/Bullseye_XFCE/scripts
sudo ./non-free.sh

sudo apt-get update

sudo apt install -y task-xfce-desktop libreoffice*- parole- && sudo apt install -y firefox-esr bleachbit mpd ncmpcpp geany synaptic doublecmd-common terminator rxvt-unicode simplescreenrecorder gdebi mpv package-update-indicator firmware-linux firmware-linux-nonfree firmware-misc-nonfree  mousepad ristretto  psmisc flameshot diodon fonts-firacode lightdm lightdm-gtk-greeter package-update-indicator plymouth-themes qt5-style-plugins wmctrl xdotool htop xfce4-xkb-plugin numlockx curl bsdmainutils arc-theme
sudo apt install -y ttf-mscorefonts-installer qbittorrent --no-install-recommends
sudo apt install -y pcmanfm-qt --no-install-recommends

cp -Rp ~/Bullseye_XFCE/.config ~/

cp -p ~/Bullseye_XFCE/.Xresources ~/

sudo cp ~/Bullseye_XFCE/ncmpcpp_48x48.png /usr/share/icons

#sudo chmod 777 /usr/share/icons/ncmpcpp_48x48.png


# korekcija autorizacije za gdebi
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
# sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
# sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy

#sudo chmod 777 ~/keyboard.sh

## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp ~/Bullseye_XFCE/scripts/debinfo /usr/bin
sudo chmod 755 /usr/bin/debinfo
echo debinfo >> ~/.bashrc

## instalacija comptona
cp ~/Bullseye_XFCE/scripts/install_compton.sh ~/.scripts
mkdir ~/bin
cp ~/Bullseye_XFCE/start-compton.sh ~/bin
sudo chmod -R 755 ~/bin

## instalacija ncmpcpp
cp -Rp ~/Bullseye_XFCE/.ncmpcpp ~/
cp -Rp ~/Bullseye_XFCE/.mpd ~/
echo "Exec=x-terminal-emulator -T 'ncmpcpp' -e ncmpcpp" > /tmp/ncmpcpp_replacement
sudo sed -i "s/^.*Exec=ncmpcpp.*$/$(cat /tmp/ncmpcpp_replacement)/" /usr/share/applications/ncmpcpp.desktop
sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ncmpcpp.desktop
echo "Icon=/usr/share/icons/ncmpcpp_48x48.png" >> /usr/share/applications/ncmpcpp.desktop

## screeny
cp -p ~/Bullseye_XFCE/scripts/screeny ~/.scripts

## script for reinstall youtube-dl
cp -p ~/Bullseye_XFCE/scripts/reinstall_youtube-dl.sh ~/.scripts

## Geany theme settings
# cp -p ~/Bullseye_XFCE/scripts/settings_geany ~/.scripts
# cd ~/.scripts
# sudo ./settings_geany

## obmenu-generator
cp -p ~/Bullseye_XFCE/scripts/obmenu-generator.sh ~/.scripts

# mkdir ~/projects
# cd ~/projects
# git clone https://github.com/speja969/debian-openXFCE.git

# cd ~/projects/debian-openXFCE/10_openXFCE_terminator
# sudo ./install.sh

# cd ~/projects/debian-openXFCE/10_openXFCE_arc-theme-gtk
# sudo ./install.sh

# cd ~/projects/debian-openXFCE/10_openXFCE_numix-paper-icons
# sudo ./install.sh

cd /home/$(logname)/Bullseye_XFCE/scripts && sudo ./wps-office.sh
cd /home/$(logname)/Reports
sudo dpkg -i wps-office.deb
sudo apt-get -f install && rm wps-office.deb
cd /home/$(logname)/Bullseye_XFCE/scripts/
sudo ./install_missing_wps_fonts.sh

# Nordic-master
mkdir -p /home/$(logname)/.themes
mkdir -p /tmp/unziped
cd /tmp/unziped && wget wget https://github.com/EliverLara/Nordic/archive/refs/heads/master.zip
unzip master.zip -d /home/$(logname)/.themes
xfconf-query -c xsettings -p /Net/ThemeName -s "Nordic-master"



# Flat-Remix-Blue
mkdir -p /tmp/unziped1 && mkdir /home/$(logname)/.icons
cd /tmp/unziped1 && wget https://github.com/daniruiz/flat-remix/archive/refs/heads/master.zip && unzip master.zip
cp -pr flat-remix-master/Flat-Remix-Blue-Dark /home/$(logname)/.icons && cp -pr flat-remix-master/Flat-Remix-Blue-Light /home/$(logname)/.icons
xfconf-query -c xsettings -p /Net/IconThemeName -s "Flat-Remix-Blue-Dark"
sudo update-icon-caches /home/$(logname)/.icons/*


# cd ~/projects/debian-openXFCE/10_openXFCE_conky
# sudo ./install.sh

# cd ~/projects/debian-openXFCE/config_shortcut-kill-x
# sudo ./install.sh

# cd ~/projects/debian-openXFCE/10_openXFCE_nomacs-viewer
# sudo ./install.sh
# sudo chmod --recursive 777 ~/.config/nomacs

# cd ~/projects/debian-openXFCE/config_disable-services
# sudo ./install.sh

# Copy wallpapers folderes
sudo cp -Rp ~/Bullseye_XFCE/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -Rp ~/Bullseye_XFCE/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds

# sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openXFCE/15_openXFCE_wallpaper-packs/install.sh
# sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!bridge-2936500_1920.jpg!' ~/projects/debian-openXFCE/15_openXFCE_wallpaper-packs/install.sh
# sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/bridge-2936500_1920.jpg!' ~/projects/debian-openXFCE/15_openXFCE_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
# cd ~/projects/debian-openXFCE/15_openXFCE_wallpaper-packs
# sudo ./install.sh

sudo cp ~/Bullseye_XFCE/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
sudo chmod 777 /usr/share/images/desktop-base/lightdm_login.jpg
sudo sed -i 's!#background=!background=/usr/share/images/desktop-base/lightdm_login.jpg!' /etc/lightdm/lightdm-gtk-greeter.conf

#sudo chmod --recursive 777 ~/.config

## setting default text editor
xdg-mime default pcmanfm-qt.desktop inode/directory


## settings htop.desktop & ranger.desktop files
echo "Exec=x-terminal-emulator -T 'htop task manager' -e htop" > /tmp/htop_replacement

sudo sed -i "s/^.*Exec=htop.*$/$(cat /tmp/htop_replacement)/" /usr/share/applications/htop.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/htop.desktop

echo "Exec=x-terminal-emulator -T 'ranger task manager' -e ranger" > /tmp/ranger_replacement

sudo sed -i "s/^.*Exec=ranger.*$/$(cat /tmp/ranger_replacement)/" /usr/share/applications/ranger.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ranger.desktop

mkdir -p ~/.urxvt/ext
cp -p ~/Bullseye_XFCE/ext/* ~/.urxvt/ext/
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/urxvtc 50
sudo update-alternatives --set x-terminal-emulator /usr/bin/terminator

cd ~/Bullseye_XFCE/scripts/openbox_conky
sudo ./install.sh

cd ~/Bullseye_XFCE/scripts/install_vim/
sudo ./install.sh

sudo ln -s /usr/bin/python3 /usr/bin/python

#sudo chown -R $(logname):$(logname) /home/$(logname)/
#find /home/$(logname) -name '.*' | xargs sudo chown $(logname):$(logname)
#find /home/$(logname) -type f | xargs sudo chmod 700

