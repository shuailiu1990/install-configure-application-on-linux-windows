# install-configure-in-linux
Save shell scripts to install applications automatically in linux, and back up configuration files of vim, bash and so on, for example, .vimrc and .bashrc. 
## Content:
- [Linux](#linux)
  - [Script to install application](#Script-to-install-application)
    - [Install application in Debian](#Install-application-in-Debian)
  - [Backup of configuration file](#Backup-of-configuration-file)
    - [Configuration of shell](#Configuration-of-shell)
    - [VIM](#vim)
    - [Path of application](#Path-of-application)
- [Windows](#windows)
  - [Configuration of Windows terminal](#Configuration-of-Windows-terminal)
  - [Install WSL2](#Install-WSL2)
  - [Configuration of WSL2](#Configuration-of-WSL2)

### Linux
#### Script to install application
##### Install application in Debian
The script app-install-ubuntu.sh can be used to install applications and their plugins automatically in Ubuntu/Debian, e.g., zsh, oh my zsh, vim-plug.  

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
#### Install WSL2

### Configuration of WSL2
.wslconfig is the configuration file of WSL2. The resource limit of WSL2 on Windows can be set in .wslconfig, e.g., the memory and number of CPU core. The file .wslconfig is on C:\Users\UserName on Windows.
