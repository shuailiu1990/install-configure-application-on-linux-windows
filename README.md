# Install Applications and Configure them on Linux and Windows
## Content:
- [Linux](#linux)
  - [Script to install application](#Script-to-install-application)
    - [Install application in Ubuntu](#Install-application-in-Ubuntu)
  - [Backup of configuration file](#Backup-of-configuration-file)
    - [Configuration of shell](#Configuration-of-shell)
    - [VIM](#vim)
    - [Path of application](#Path-of-application)
- [Windows](#windows)
  - [Configuration of Windows terminal](#Configuration-of-Windows-terminal)
  - [Install WSL2 and Linux on it](#Install-WSL2-and-Linux-on-it)
  - [Configuration of WSL2](#Configuration-of-WSL2)
  - [Uninstall WSL2 and Linux on it](#Uninstall-WSL2-and-Linux-on-it)

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
2. 以**管理员身份**打开**Windows PowerShell**, 然后执行
3. Set default version of WSL to 2, i.e., WSL2
   ```
   wsl --set-default-version 2
   ```
4. Update WSL
   ```
   wsl&nbsp; --update
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
7. Install a specified Linux distribution
   ```
   wsl --install -d xxx
   ```
   where xxx is a specified Linux distribution, e.g., Ubuntu-20.04

#### Configuration of WSL2
.wslconfig is the configuration file of WSL2. The resource limit of WSL2 on Windows can be set in .wslconfig, e.g., the memory and number of CPU core. The file .wslconfig is on the following directory on Windows
```
C:\Users\UserName
```

#### Uninstall WSL2 and Linux on it
在Windows的**应用与程序**或**电脑管家软件（例如电脑管家）** 中依次卸载安装Linux发行版和WSL。
