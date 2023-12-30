# install-configure-in-linux
Save shell scripts to install applications automatically in linux, and back up configuration files on vim, zsh and so on, for example, .vimrc, .bashrc. 
## Content:
- [Script to install application](#Script-to-install-application)
  - [Install application in Debian](#Install-application-in-Debian)
- [Backup of configuration file](#Backup-of-configuration-file)
  - [Configuration of shell](#Configuration-of-shell)
  - [VIM](#vim)
  - [The path of application](#The-path-of-application)

### Script to install application
#### Install application in Debian
The script app-install-ubuntu.sh can be used to install applications and their plugins automatically in Ubuntu/Debian, e.g., zsh, oh my zsh, vim-plug.  

### Backup of configuration file
#### Configuration of shell
.bashrc and .bashrc_profile are the configuration files of bash on $HOME, and .zshrc are the configuration file of zsh on $HOME.
#### VIM
.vimrc is the configuration file of vim on the directory $HOME.
#### The path of application
profile.d is a directory including the paths of applications on $HOME. The paths of applications are in the bash files. When you want to add the paths of applications into .bashrc or .zshrc, you can add 
```
source ~/profile.d/xxx.sh
```
into .bashrc or .zshrc.
