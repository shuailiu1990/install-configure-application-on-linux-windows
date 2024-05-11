#Install Scoop
#Set-ExecutionPolicy RemoteSigned -scope CurrentUser
#iwr -useb get.scoop.sh | iex
#
## Install sudo with Scoop
#Scoop install sudo
#
## Install Starship with Scoop
#Scoop install starship
#
## Install Neovim with Scoop
#Scoop install neovim 

Install-Module PowerShellGet -scope CurrentUser -Force -AllowClobber
Install-Module PSReadLine -scope CurrentUser
