#!/bin/bash

if [ ! -d ~/download ]; then
    mkdir ~/download
fi

if [ ! -d ~/opt ]; then
    mkdir ~/opt
fi

#--------    zsh    --------
# The reference link: https://phoenixnap.com/kb/install-zsh-ubuntu, https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df

if ! which zsh 1>/dev/null 2>&1; then
    echo "\033[31m zsh is not installed! \033[0m"

    # Enter the decision to determine whether to install zsh in command line 
    read -p "Install zsh? (y/n):" flag_install_zsh 
    
    if [ $flag_install_zsh = "y" ]; then
        # Enter the decision to determine whether to install zsh from sourcecode in command line 
        read -p "Install zsh from sourcecode without sudo permission (y/n):" flag_way_install_zsh_without_sudo 
        
        if [ $flag_way_install_zsh_without_sudo = "y" ]; then 
            # Install zsh from sourcecode without sudo permission. If the source code cannt be downloaded, we can copy them from a computer to the target one. 
            if [ ! -e ~/download/zsh*.tar.gz ]; then
                wget https://sourceforge.net/projects/zsh/files/latest/download -O ~/download/zsh.tar.gz
            fi &&
            
            cd ~/download &&
            
            if [ ! -d ./zsh ]; then
                mkdir zsh
            fi &&
            
            tar -xf zsh.tar.gz -C ./zsh --strip-components 1 &&
            cd ./zsh &&
            make clean &&
            ./configure --prefix=$HOME/opt/zsh &&
            make && 
            make install
            cd ..
            # Some configrations need to be written in the file ~/.bash_profile and ~/.bashrc
        else
            # Install zsh by sudo permission 
            sudo apt update && 
            sudo apt install zsh-y && 
            
            # Set zsh as the default shell
            chsh -s $(which zsh) 
        fi
        echo zsh is installed successuflly now!
    fi
else
    echo -e "\033[31m zsh have been installed before! \033[0m"
fi
# Note that the configrations on zsh are in the file ~/.zshrc. The configrations (e.g., path) in .bashrc need to be copied to .zshrc.


#--------    oh my zsh     --------

if [ ! -d ~/.oh-my-zsh ]; then
    echo oh my zsh is not installed!

    # Enter the decision to determine whether to install oh my zsh in command line 
    read -p "Install oh my zsh? (y/n):" flag_install_oh_my_zsh 

    if [ $flag_install_oh_my_zsh = "y" ]; then
        read -p "Install on my zsh from sourcecode without sudo permission (y/n):" flag_way_install_on_my_zsh_without_sudo
        
        if [ $flag_way_install_on_my_zsh_without_sudo = "y" ]; then
            # Install oh my zsh without sudo permission
            git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
        else
            # Install oh my zsh with sudo permission. If it cannot be downloaded, we can copy ~/.oh-my-zsh in a computer to ~/ in the target computer.
            sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 
        fi
    fi
    echo oh my zsh is installed successuflly now!  
else
    echo oh my zsh has been installed before!
fi


#--------    Plugin of oh my zsh     --------

# Enter the decision to determine whether to install plugins of oh my zsh in command line 
read -p "Install plugins of oh my zsh? (y/n):" flag_install_plugins_of_oh_my_zsh 

if [ $flag_install_plugins_of_oh_my_zsh = "y" ]; then
    # Install some plugins of oh my zsh. If the plugins cannot be downloaded, we can copy them from ~/.oh-my-zsh/custom/plugins in a computer to ~/.oh-my-zsh/custom/plugins in the target computer.
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting &&
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete 
fi
echo Plugisns of oh my zsh are installed successuflly!


#--------    Compelling environment  --------

# Install autoconf
if ! which autoconf 1>/dev/null 2>&1; then
    echo autoconf is not installed
    
    read -p "Install autoconf (y/n):" flag_install_autoconf
    if [ $flag_install_autoconf = "y" ]; then
        read -p "Install autoconf from sourcecode without sudo permission (y/n):" flag_way_install_autoconf_without_sudo
        
        if [ $flag_way_install_autoconf_without_sudo = "y"]; then
            echo dd
        else 
            sudo apt install autoconf
        fi
        echo autoconf is installed now!
    fi
else
    echo autoconf has been installed before!
fi

# Install automake
if ! which automake 1>/dev/null 2>&1; then
    echo automake is not installed
    
    read -p "Install automake (y/n):" flag_install_automake
    if [ $flag_install_automake = "y" ]; then
        read -p "Install automake from sourcecode without sudo permission (y/n):" flag_way_install_automake_without_sudo
        
        if [ $flag_way_install_automake_without_sudo = "y"]; then
            echo dd
        else 
            sudo apt install automake
        fi
        echo automake is installed now!
    fi
else
    echo automake has been installed before!
fi

# Install pkg-config
if ! which pkg-config 1>/dev/null 2>&1; then
    echo pkg-config is not installed
    
    read -p "Install pkg-config (y/n):" flag_install_pkg_config
    if [ $flag_install_pkg_config = "y" ]; then
        read -p "Install pkg-config from sourcecode without sudo permission (y/n):" flag_way_install_pkg_config_without_sudo
        
        if [ $flag_way_install_pkg_config_without_sudo = "y"]; then
            echo dd
        else 
            sudo apt install pkg-config 
        fi
        echo pkg-config is installed now!
    fi
else
    echo pkg-config has been installed before!
fi

# Install libtool 
if [ ! whereis pkg-config 1>/dev/null 2>&1 ]; then
    echo libtool is not installed
    
    read -p "Install libtool (y/n):" flag_install_libtool
    if [ $flag_install_libtool = "y" ]; then
        read -p "Install libtool from sourcecode without sudo permission (y/n):" flag_way_install_libtool_without_sudo
        
        if [ $flag_way_install_libtool_without_sudo = "y"]; then
            echo dd
        else 
            sudo apt install libtool 
        fi
        echo libtool is installed now!
    fi
else
    echo libtool has been installed before!
fi


#--------    Environment or software that some plugins of vim require   --------
# The link on installing universal ctags from sourcecode is https://github.com/universal-ctags/ctags

if ! which ctags 1>/dev/null 2>&1; then
    echo universal ctags is not installed!
    
    # Install universal ctags which tagbar requires 
    read -p "Install universal ctags? (y/n):" flag_install_universal_ctags
    
    if [ $flag_install_universal_ctags = "y" ]; then
        # Enter the decision to determine whether to install universal ctags from sourcecode in command line 
        read -p "Install ctags from sourcecode without sudo permission (y/n):" flag_way_install_universal_ctags_without_sudo 
        
        if [ $flag_way_install_universal_ctags_without_sudo = "y" ]; then
            cd ~/download &&
           
            if [ ! -e ./ctags ]; then
                git clone https://github.com/universal-ctags/ctags.git
            fi &&
    
            cd ctags &&
            ./autogen.sh &&
            ./configure --prefix=$HOME/opt/ctags && # set the installation directory, defaults to /usr/local
            make &&
            make install 
        else
            sudo apt install universal-ctags
        fi
    fi
    echo universal ctags is installed successuflly now!
else
    echo universal ctags has been installed before!
fi


#--------    Plugin of vim    --------

# Install the vim plugins manager called vim-plug
if [ ! -e ~/.vim/autoload/plug.vim ]; then
    echo "\033[31m The vim plugins manager called vim-plug is not installed! \033[0m"
    
    read -p "Install vim-plug? (y/n):" flag_install_vim_plug

    if [ $flag_install_vim_plug = "y" ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
else
    echo "\033[31m The vim plugins manager vim-plug has been installed before! \033[0m" 
fi
