# Install Applications and Configure them on Linux and Windows
## Content:
- [Linux](#linux)
  - [Script to install application](#script-to-install-application)
    - [Install application in Ubuntu](#install-application-in-Ubuntu)
  - [Backup of configuration file](#backup-of-configuration-file)
    - [Configuration of shell](#configuration-of-shell)
    - [VIM](#vim)
    - [Path of application](#path-of-application)
- [Windows](#windows)
  - [Configuration of Windows terminal](#configuration-of-Windows-terminal)
  - [Install WSL2 and Linux on it](#install-wsl2-and-Linux-on-it)
  - [Configuration of WSL2](#configuration-of-wsl2)
  - [Uninstall WSL2 and Linux on it](#uninstall-wsl2-and-linux-on-it)
  - [Install Nerd Font](#install-nerd-font)
- [Application Manual](#application-manual)
  - [Git](#git)
    - [Add public key on Linux into GitHub](#add-public-key-on-linux-into-github)
  - [Vim-Plug](#vim-plug)

### Linux
#### Script to install application
##### Install application in Ubuntu
The script app-install-ubuntu.sh can be used to install applications and their plugins automatically in Ubuntu/Ubuntu, e.g., zsh, oh my zsh, vim-plug.  

#### Backup of configuration file
##### Configuration of shell
.bashrc and .bashrc_profile are the configuration files of bash on $HOME, and .zshrc are the configuration file of zsh on $HOME.
##### VIM
.vimrc is the configuration file of vim on $HOME.
##### Path of application
profile.d is a directory including the paths of applications on $HOME. The paths of applications are in the bash files. When you want to add the paths of applications into .bashrc or .zshrc, you can add the following command in to .bashrc or .zshrc
```
source ~/profile.d/xxx.sh
```
where xxx is the name of application.

### Windows
#### Configuration of Windows terminal
settings.json is the configuration file of Windows terminal on  
```
C:\Users\UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
```
#### Install WSL2 and Linux on it
1. 在Windows搜索框中搜索**启用或关闭Windows功能**，然后开启**适用于Linux的Windows子系统**和**虚拟机平台**，最后reboot Windows

2. 以**管理员身份**打开**Windows PowerShell**, 然后依次执行以下3-7步骤

3. Set default version of WSL to 2, i.e., WSL2
   ```
   wsl --set-default-version 2
   ```
4. Update WSL
   ```
   wsl --update
   ```
   or
   ```
   wsl --update --pre-release
   ```
   如果更新失败，在Windows更新选项中打开**接收其它Microsoft产品的更新**
5. Install WSLg
   ```
   wsl --install
   ```
6. List all the Linux distributions avaiable
   ```
   wsl --list --online
   ```
   or
   ```
   wsl -l -o
   ```
7. Install a Linux distribution
   ```
   wsl --install -d xxx
   ```
   where xxx is a Linux distribution, e.g., Ubuntu-20.04

#### Configuration of WSL2
.wslconfig is the configuration file of WSL2. The resource limit of WSL2 on Windows can be set in .wslconfig, e.g., the memory and number of CPU core. The file .wslconfig is on the following directory on Windows
```
C:\Users\UserName
```

#### Uninstall Linux on WSL2
The Linux distribution is represented by **xxx**
1. Open PowerShell
2. ```
   wsl --terminate xxx
   ```
3. ```
   wsl --unregister xxx
   ```
4. Delete all the files on Linux, the files are on
   ```
   C:\Users\UserName\AppData\Local\Packages\yyy.xxx.zzz
   ```
#### Install Nerd Font
1. Download Nerd Font from **Download Zip** of **Code** on https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#patched-fonts
2. Open PowerShell
3. ```
   ./install.ps1
   ```
### Application Manual
#### Git
##### Add public key on Linux into GitHub
1. ```
   cd ~/.ssh
   ```
   if .ssh does not exist, then
   ```
   mkdir ~/.ssh
   ```
2. ```
   ssh-keygen -t rsa -C "youremail@example.com"
   ```
   where youremail@example.com is your email on GitHub. When some prompt information，e.g., Enter file in which to save the key， Enter passphrase, etc., just press Enter.
3. ```
   vim id_rsa.pub
   ```
   and then copy the content beginning with **ssh-rsa** to **SSH and GPG Keys** of **Settings** of your account on GitHub.
#### Vim-Plug
We input the following commands in vim, and press Enter
- Install plugins
  ```
  :PlugInstall
  ```
  All the plugins in .vimrc can be installed with the above command.
- Clean plugins
  Firstly, comment the plugin xxx in .vimrc, and then enter
  ```
  :PlugClean xxx
  ```
- Update plugin
  ```
  :PlugUpdate
  ```
- Check the changed state of plugin
  ```
  :PlugDiff
  ```
- Check the state of plugin
  ```
  :PlugStatus
  ```
