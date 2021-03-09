#!/bin/bash
BOOT="MBR"
DISK="/dev/sda"
BOOTPART="/dev/sda1"
ROOTPART="/dev/sda2"
SWAPPART=""
SWAP_EXISTS=false
HOST="LITHIUM"

[ "$SWAPPART" == "" ] && SWAP_EXISTS=false || SWAP_EXISTS=true


# ===================== BOOT MODE =====================
echo "Verifying boot mode..."
sleep 1

if [ -z "$(ls /sys/firmware/efi/efivars)" ]; then
    echo "Boot Mode: MBR"
else
    echo "Boot Mode: UEFI"
    BOOT="UEFI"
fi
sleep 1


# ===================== SYSTEM CLOCK =====================
echo "Updating system clock..."
sleep 1
timedatectl set-ntp true


# ===================== DISK PARTITIONING =====================
echo "Partitioning disc..."
sleep 1
fdisk $DISK


# ===================== FORMAT PARTITIONS =====================
echo "Formatting partitions..."
sleep 1
mkfs -t vfat $BOOTPART
mkfs -t ext4 $ROOTPART

if [ $SWAP_EXISTS ]; then
    mkswap $SWAPPART
    swapon $SWAPPART
fi


# ===================== MOUNT PARTITIONS =====================
echo "Mounting partitions..."
sleep 1
mount $DISK /mnt


# ===================== PACSTRAP =====================
echo "Running pacstrap..."
sleep 1
pacstrap /mnt base linux linux-firmware vim kitty man-db man-pages texinfo iwd networkmanager git curl unzip grub efibootmgr xorg-server xorg-init binutils fakeroot


# ===================== FSTAB =====================
echo "Generating /etc/fstab..."
sleep 1
genfstab -U /mnt >> /mnt/etc/fstab


# ===================== CHROOT =====================
echo "Chrooting into new system..."
sleep 1
arch-chroot /mnt


# ===================== TIMEZONE =====================
echo "Configuring timezone info..."
sleep 1
ln -sf /usr/share/zoneinfo/America/Detroit /etc/localtime
hwclock --systohc


# ===================== LOCALIZATION =====================
echo "Configuring localization..."
sleep 1
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8' /etc/locale.gen
touch /etc/locale.conf
echo "LANG=en_US.UTF-8" >> /etc/locale.conf


# ===================== NETWORK CONFIGURATION =====================
echo "Configuring network..."
sleep 1
[ -f "/etc/hostname" ] && : || touch /etc/hostname
echo $HOST >> /etc/hostname
[ -f /etc/hosts ] && : || touch /etc/hosts
echo "127.0.0.1             localhost" >> /etc/hosts
echo "::1                   localhost" >> /etc/hosts
echo "127.0.1.1             $HOST.localdomain   $HOST" >> /etc/hosts


# ===================== ROOT PASSWORD =====================
echo "Updating root password..."
sleep 1
passwd


# ===================== BOOTLOADER =====================
echo "Configuring bootloader..."
sleep 1
if [ "$BOOT" == "MBR" ]; then
    grub-install --target=i386-pc $DISK
else
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg


# ===================== FINISH =====================
echo "Finishing installation..."
sleep 1
exit
umount -R /mnt
echo
echo
echo "Installation finished! Please Reboot."
echo
echo
