colemak�������� loadkeys colemak
���� wifi��
 iwctl
device list
station wlan0 scan
station wlan0 get- networks
station wlan0 connect wifi��
timedatectl set-ntp true
fdisk -l
fdisk /dev/sda
n ������һ·�س�
fdisk -l
mkfs.ext4  /dev/sdan
mkfs.btrfs -L myArch /dev/sdxn
mount /dev/sdan   /mnt  
mkdir /mnt/boot
//����һ����sdanΪefi������
mount /dev/sdan   /mnt/boot
 vim /etc/pacman.d/mirrorlist
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
 pacstrap /mnt base base-devel linux linux-firmware dhcpcd
genfstab -L    /mnt   >>  /mnt/etc/fstab
cat  /mnt/etc/fstab
arch-chroot /mnt 
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
pacman -S vim dialog wpa_supplicant ntfs-3g networkmanager netctl
vim /etc/locale.gen
���zh_CN.UTF-8  zh_HK.UTF-8   zh_TW.UTF-8   en_US.UTF-8
locale-gen

vim /etc/locale.conf
LANG=en_US.UTF-8
vim /etc/hostname 
���������� myarch

vim /etc/hosts
127.0.0.1   localhost
::1         localhost
127.0.1.1   myarch.localdomain	myarch
passwd

pacman -S intel-ucode

pacman -S os-prober ntfs-3g

pacman -S grub efibootmgr os-prober

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub

grub-mkconfig -o /boot/grub/grub.cfg

vim /etc/default/grub

ȥ�� GRUB_CMDLINE_LINUX_DEFAULT һ�������� quiet ����
�� loglevel ����ֵ�� 3 �ĳ� 5��������Ϊ�˺����������ϵͳ���󣬷����Ŵ�
���� nowatchdog �����������������߿��ػ��ٶ�
Ϊ������ win10������Ҫ����µ�һ��?
GRUB_DISABLE_OS_PROBER=false

grub-mkconfig -o /boot/grub/grub.cfg

exit
reboot
�ε�U��


systemctl enable NetworkManager
systemctl start NetworkManager
nmcli dev wifi list

nmcli dev wifi connect "����" password "����"
dd if=/dev/zero??of=/swapfile bs=1G count=20 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon  /swapfile
vim /etc/fstab
/swapfile none swap defaults 0 0
useradd -m -G wheel   [����]
passwd[����]
pacman -S sudo
ln -s  /usr/bin/vim  /usr/bin/vi  
visudo
���� ��wheel ALL=��ALL��ALL
sudo vim /etc/pacman.conf
���� [multilib]
���� [archlinuxcn]

[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch # �й���ѧ������ѧ��Դ����վ
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch # �廪��ѧ��Դ�������վ
Server = https://mirrors.hit.edu.cn/archlinuxcn/$arch # ��������ҵ��ѧ��Դ����վ
Server = https://repo.huaweicloud.com/archlinuxcn/$arch # ��Ϊ��Դ����վ

sudo pacman -Syy

sudo pacman -S archlinuxcn-keyring

sudo pacman -S xf86-video-intel mesa

sudo pacman -S xorg plasma kde-applications sddm network-manager-applet


 ���ò����� greeter sddm
���� sddm.service �ػ����̣�
systemctl enable sddm
ͨ����������������ʾ���������������ԣ����ɿ�����ӭ���棺
systemctl start sddm  # ֱ��������ʾ��������������reboot�����ѡһ����
reboot

sudo pacman -S wqy-microhei wqy-microhei-lite wqy-bitmapfont wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts noto-fonts-cjk



sudo pacman -S git
sudo pacman -S yay  alacritty   picom  nitrogen  rofi


