# Arch Linux Wsl 指南

## 如何安装

安装wsl时不安装Linux发行版本
`wsl --install --no-distribution`

在 `%USERPROFILE%` 这个目录下创建一个 `.wslconfig` 文件

```.wslconfig
[wsl2]
memory=4GB
swap=4GB

[experimental]
autoMemoryReclaim=gradual
networkingMode=mirrored
dnsTunneling=true
firewall=true
autoProxy=true
```

[GitHub下载地址](https://github.com/yuk7/ArchWSL)
下载 `Arch.zip`

解压放到某一目录文件下，双击 `Arch.exe`

## 设置用户名和密码
设置 root 密码
```sh
passwd 
```

添加用户名并且添加 `sudo` 权限
```sh
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
```

```sh
useradd -m -G wheel -s /bin/bash <username>
```

```sh
passwd <username>
```

## 设置 wsl 默认打开的用户为刚才设置的 `<username>`

在 Arch 存放的目录下使用 `powershell` 打开

```sh
.\Arch.exe config --default-user <username>
```

## Arch Linux 配置

换源，编辑 `/etc/pacman.d/mirrorlist`，在文件的最顶部添加：
```
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
```

```sh
sudo pacman-key --init
```

```sh
sudo pacman-key --populate
```

```sh
sudo pacman -Syy archlinux-keyring
```

糖豆人彩蛋
编辑 `/etc/pacman.conf` 文件，在 `# Misc options` 下面，删掉 `Color` 前面的注释，添加一行 `ILoveCandy`。

安装必要软件包：
```sh
sudo pacman -S base-devel git nvim fish tmux fd tree man eza
```

切换 shell 为 fish
```sh 
chsh -s /usr/bin/fish
```

安装 Oh-My-Fish
```sh
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

安装 `paru`
```sh
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

安装 [yazi](https://yazi-rs.github.io/)
```
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick
paru -S resvg
```
然后将官方文档的配置文件复制到 `~/.config/yazi/` 目录下即可。

rust 环境配置
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

更新 PATH 变量以包含 Cargo bin 目录
```sh 
source "$HOME/.cargo/env"
```
查看是否安装完成
```sh
rustc --version
```

flutter 环境配置
```sh
paru -S flutter
paru -S android-sdk
paru -S dart
paru -S android-tools
paru -S android-sdk-platform-tools
paru -S android-sdk-cmdline-tools-latest
paru -S android-sdk-build-tools-35
paru -S android-platform-35

flutter config --android-sdk /opt/android-sdk
sudo chown -R pluveto:pluveto /opt/flutter
sudo chown -R pluveto:pluveto /opt/android-sdk
sudo chown -R pluveto:pluveto /opt/dart-sdk

flutter doctor --android-licenses

flutter doctor -v
```

go 环境配置
```sh
sudo pacman -S go
mkdir -p $HOME/go/{bin,src,pkg}
set -Ux GOPATH $HOME/go
set -Ux PATH $PATH $GOPATH/bin
source ~/.config/fish/config.fish
```

c++ 环境配置
```sh
sudo pacman -S clang
```

```sh
```

```sh
```
