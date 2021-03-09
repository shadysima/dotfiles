#!/bin/bash

USER="nick"
DE="gnome"
LOGIN="cinnamon"


# ================== SUDOERS ==================
echo "Disabling password requirement for sudo..."
sleep 1
awk '/NOPASSWD/ {gsub(/# %wheel/, "%wheel")}{print}' /etc/sudoers > /etc/sudoers-edit
mv /etc/sudoers /etc/sudoers.bak
mv /etc/sudoers-edit /etc/sudoers

# ================== SERVICES ==================
echo "Enabling vital services..."
sleep 1
systemctl enable networkmanager
systemctl start networkmanager
systemctl enable iwd
systemctl start iwd

# ================== CREATING USER ==================
echo "Creating user $USER..."
sleep 1
useradd -m -G wheel $USER
passwd $USER

# ================== DISPLAY ==================
echo "Configuring display services..."
sleep 1

if [ "$DE" == "gnome" ]; then
    LOGIN="gdm"
elif [ "$DE" == "kde" ]; then
    LOGIN="lightdm"
elif [ "$DE" == "cinnamon" ]; then
    LOGIN="gdm"
elif [ "$DE" == "budgie" ]; then
    LOGIN="gdm"
fi

function install-gnome {
    pacman -S gnome gnome-tweaks gdm
    systemctl enable $LOGIN
}

function install-kde {
    pacman -S plasma-desktop lightdm lightdm-gtk-greeter
    systemctl enable $LOGIN
}

function install-cinnamon {
    pacman -S cinnamon gdm gnome-tweaks
    systemctl enable $LOGIN
}

function install-budgie {
    pacman -S budgie-desktop gnome gnome-tweaks gdm
    systemctl enable $LOGIN
}

if [ "$DE" == "gnome" ]; then
    install-gnome
elif [ "$DE" == "kde" ]; then
    install-kde
elif [ "$DE" == "cinnamon" ]; then
    install-cinnamon
elif [ "$DE" == "budgie" ]; then
    install-budgie
fi

# ================== FINISHING ==================
echo "Finishing up..."
sleep 1
mkdir /home/nick/workspace
mkdir /home/nick/workspace/c
mkdir /home/nick/workspace/cpp
mkdir /home/nick/workspace/java
mkdir /home/nick/workspace/python
mkdir /home/nick/workspace/scripts
mkdir /home/nick/workspace/go
mkdir /home/nick/source


# ================== START DISPLAY ==================
echo "Starting display service..."
sleep 1
systemctl start $LOGIN