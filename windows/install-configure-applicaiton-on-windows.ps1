# Install Starship 
#winget install --id Starship.Starship

# Install Scoop
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

# Install sudo with Scoop
Scoop install sudo
