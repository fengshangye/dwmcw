colemak键盘设置 loadkeys colemak
联网 wifi：
 iwctl
device list
station wlan0 scan
station wlan0 get- networks
station wlan0 connect wifi名
timedatectl set-ntp true
fdisk -l
fdisk /dev/sda
n ——》一路回车
fdisk -l
mkfs.ext4  /dev/sdan
mkfs.btrfs -L myArch /dev/sdxn
mount /dev/sdan   /mnt  
mkdir /mnt/boot
//下面一条的sdan为efi的区间
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
激活：zh_CN.UTF-8  zh_HK.UTF-8   zh_TW.UTF-8   en_US.UTF-8
locale-gen

vim /etc/locale.conf
LANG=en_US.UTF-8
vim /etc/hostname 
输入主机名 myarch

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

去掉 GRUB_CMDLINE_LINUX_DEFAULT 一行中最后的 quiet 参数
把 loglevel 的数值从 3 改成 5。这样是为了后续如果出现系统错误，方便排错
加入 nowatchdog 参数，这可以显著提高开关机速度
为了引导 win10，则还需要添加新的一行?
GRUB_DISABLE_OS_PROBER=false

grub-mkconfig -o /boot/grub/grub.cfg

exit
reboot
拔掉U盘


systemctl enable NetworkManager
systemctl start NetworkManager
nmcli dev wifi list

nmcli dev wifi connect "名字" password "密码"
dd if=/dev/zero??of=/swapfile bs=1G count=20 status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon  /swapfile
vim /etc/fstab
/swapfile none swap defaults 0 0
useradd -m -G wheel   [名字]
passwd[名字]
pacman -S sudo
ln -s  /usr/bin/vim  /usr/bin/vi  
visudo
激活 ：wheel ALL=（ALL）ALL
sudo vim /etc/pacman.conf
激活 [multilib]
输入 [archlinuxcn]

[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch # 中国科学技术大学开源镜像站
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch # 清华大学开源软件镜像站
Server = https://mirrors.hit.edu.cn/archlinuxcn/$arch # 哈尔滨工业大学开源镜像站
Server = https://repo.huaweicloud.com/archlinuxcn/$arch # 华为开源镜像站

sudo pacman -Syy

sudo pacman -S archlinuxcn-keyring

sudo pacman -S xf86-video-intel mesa

sudo pacman -S xorg plasma kde-applications sddm network-manager-applet


 配置并启动 greeter sddm
开启 sddm.service 守护进程：
systemctl enable sddm
通过以下命令启动显示管理器或重启电脑，即可看到欢迎界面：
systemctl start sddm  # 直接启动显示管理器，与以下reboot命令二选一即可
reboot

sudo pacman -S wqy-microhei wqy-microhei-lite wqy-bitmapfont wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts noto-fonts-cjk



sudo pacman -S git
sudo pacman -S yay  alacritty   picom  nitrogen  rofi


