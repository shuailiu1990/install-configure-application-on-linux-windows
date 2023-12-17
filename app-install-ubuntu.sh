#!/bin/bash

if [ ! -d ~/download ]; then
    mkdir ~/download
fi

if [ ! -d ~/opt ]; then
    mkdir ~/opt
fi

#--------    zsh    --------
# The reference links: https://phoenixnap.com/kb/install-zsh-ubuntu, https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df

# Enter the decision to determine whether to install zsh in command line 
read -p "Install zsh? (y/n):" flag_install_zsh 

if [ $flag_install_zsh = "y" ]; then
    # Enter the decision to determine whether to install zsh from sourcecode in command line 
    read -p "Install zsh from sourcecode without sudo permission (y/n):" flag_way_install_zsh 
    if [ $flag_way_install_zsh = "y" ]; then 
        # Install zsh from sourcecode. If the source code cannt be downloaded, we can copy them from a computer to the target one 
        if [ ! -d ~/download/zsh*.tar.gz ]; then
            wget https://sourceforge.net/projects/zsh/files/latest/download -O ~/download/zsh.tar.gz
        fi &&
        
        cd ~/download &&
        
        if [ ! -d ./zsh ]; then
            mkdir zsh
        fi &&
        
        tar -xf zsh.tar.gz -C ./zsh --strip-components 1 &&
        cd ./zsh && 
        
        ./configure --prefix=$HOME/opt &&
        make && 
        make install &&
        
        # Install oh my zsh
        rm -rf ~/.oh-my-zsh &&
        git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh 
        # Some configrations need to be written in the file ~/.bash_profile and ~/.bashrc
    else
        # Install zsh by sudo apt 
        sudo apt update && 
        sudo apt install zsh-y && 
        
        # Set zsh as the default shell
        chsh -s $(which zsh) &&

        # Download and install oh my zsh. If it cannot be downloaded, we can copy it from a computer to the target one.
        rm -rf ~/.oh-my-zsh &&
        sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 
    fi
    
    # Install some plugins of oh my zsh. If the plugins cannot be downloaded, we can copy them from a computer to the target one.
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting &&
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete 
fi
# Note: the configrations on zsh are in the file ~/.zshrc


#--------    vim    --------

# Install the vim plugins manager called vim-plug
read -p "Install vim-plug? (y/n):" flag_install_vim_plug

if [ $flag_install_vim_plug = "y" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # Some configrations need to be written in .vimrc
    # The usage of vim-plug are as follows
        # Install plugins: enter :PlugInstall in vim
        # Clean plugins: Firstly, comment the plugin xxx in .vimrc, and then enter :PlugClean xxx in vim
        # Update plugins: enter :PlugUpdate in vim
        # Check the changed state of plugins: enter :PlugDiff in vim
        # Check the state of plugins: enter :PlugStatus in vim
fi

# Install the environment or software that some vim plugins require

# Install ctags which tagbar requires 
read -p "Install universal ctags? (y/n):" flag_install_universal_ctags

if [ $flag_install_universal_ctags = "y" ]; then
    # Enter the decision to determine whether to install universal ctags from sourcecode in command line 
    read -p "Install ctags from sourcecode without sudo permission (y/n):" flag_way_install_universal_ctags 
    
    if [ $flag_way_install_universal_ctags = "y" ]; then
        if [ ! -d ~/download/zsh*.tar.gz ]; then
        
        fi
        # https://github.com/universal-ctags/ctags
        git clone https://github.com/universal-ctags/ctags.git &&
        cd ctags &&
        ./autogen.sh &&
        ./configure &&  # use --prefix=/where/you/want to override installation directory, defaults to /usr/local
         make &&
         make install # may require extra privileges depending on where to install
    else:
        sudo apt install universal-ctags
    fi
fi


