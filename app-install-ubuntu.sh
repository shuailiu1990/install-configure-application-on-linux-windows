#!/bin/bash

if [ ! -d ~/download ]; then
    mkdir ~/download
fi

if [ ! -d ~/opt ]; then
    mkdir ~/opt
fi

#--------    zsh    --------
# The reference link: https://phoenixnap.com/kb/install-zsh-ubuntu, https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df

# Enter the decision to determine whether ot install zsh in command line 
read -p "Install zsh? (y/n):" flag_install_zsh 

if [ $flag_install_zsh = "y" ]; then
    # Enter the decision to determine whether ot install zsh from sourcecode in command line 
    read -p "Install zsh from sourcecode without sudo permission (y/n):" flag_way_install_zsh 
    if [ $flag_way_install_zsh = "y" ]; then 
        # Install zsh from sourcecode
        if [ ! -d ~/download/zsh*.tar.gz ]; then
            wget https://sourceforge.net/projects/zsh/files/latest/download -O ~/download/zsh.tar.gz
        fi
        
        cd ~/download
        
        if [ ! -d ./zsh ]; then
            mkdir zsh
        fi
        
        tar -xf zsh.tar.gz -C ./zsh --strip-components 1
        cd ./zsh 
        
        ./configure --prefix=$HOME/opt
        make 
        make install
        
        # Install oh my zsh
        rm -rf ~/.oh-my-zsh
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
        # Some configrations need to be written in the file ~/.bash_profile and ~/.bashrc
    else
        # Install zsh by sudo apt 
        sudo apt update 
        sudo apt install zsh-y 
        
        # Set zsh as the default shell
        chsh -s $(which zsh)

        # Install oh my zsh
        rm -rf ~/.oh-my-zsh
        sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    fi
    
    # Install some plugins of oh my zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
fi
# Note: the configrations on zsh are in the file ~/.zshrc
