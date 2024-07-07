#!/bin/bash

if [ ! -d ~/download ]; then
    mkdir ~/download
fi

if [ ! -d ~/opt ]; then
    mkdir ~/opt
fi

#--------    Update software   --------

read -p "Update software with sudo? (y/n):" flag_update_software_with_sudo
if [ $flag_update_software_with_sudo = "y" ]; then
    sudo apt update &&
        sudo apt upgrade &&
        echo -e "\033[31m Update software successuflly! \033[0m"
else
    echo Software update is skipped!
fi

#--------    Neovim   --------
read -p "Install Neovim? (y/n):" flag_install_neovim
if [ $flag_install_neovim = "y" ]; then
    cd ~/download &&
        wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz &&
        if [ ! -d ~/opt/nvim ]; then
            mkdir ~/opt/nvim
        fi &&
        tar -xf nvim-linux64.tar.gz -C ~/opt/nvim --strip-components 1 &&
        echo -e "\033[31m Install Neovim successuflly! \033[0m"
else
    echo Neovim installation is skipped!
fi

#--------    Lazyvim   --------
read -p "Install Lazyvim? (y/n):" flag_install_lazyvim
if [ $flag_install_lazyvim = "y" ]; then
    cd ~ &&
        git clone https://github.com/LazyVim/starter ~/.config/nvim &&
        echo -e "\033[31m Install Lazyvim successuflly! \033[0m"
else
    echo Lazyvim installation is skipped!
fi

#--------    zsh    --------
# The reference link: https://phoenixnap.com/kb/install-zsh-ubuntu, https://gist.github.com/n1snt/454b879b8f0b7995740ae04c5fb5b7df

if ! which zsh 1>/dev/null 2>&1; then
    echo -e "\033[31m zsh is not installed! \033[0m"

    # Enter the decision to determine whether to install zsh in command line
    read -p "Install zsh? (y/n):" flag_install_zsh

    if [ $flag_install_zsh = "y" ]; then
        # Enter the decision to determine whether to install zsh from sourcecode in command line
        read -p "Install zsh with sudo (y/n):" flag_way_install_zsh_with_sudo

        if [ $flag_way_install_zsh_with_sudo = "y" ]; then
            # Install zsh by sudo permission
            sudo apt update &&
                sudo apt install zsh-y &&

                # Set zsh as the default shell
                chsh -s $(which zsh)
        else
            # Install zsh from sourcecode without sudo permission. If the source code cannt be downloaded, we can copy them from a computer to the target one.
            wget https://sourceforge.net/projects/zsh/files/latest/download -O ~/download/zsh.tar.gz &&
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
        fi
        echo zsh is installed successuflly now!
    else
        echo zsh installation is skipped!
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
        read -p "Install on my zsh with sudo (y/n):" flag_way_install_on_my_zsh_with_sudo

        if [ $flag_way_install_on_my_zsh_with_sudo = "y" ]; then
            # Install oh my zsh with sudo permission. If it cannot be downloaded, we can copy ~/.oh-my-zsh in a computer to ~/ in the target computer.
            sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
        else
            # Install oh my zsh without sudo permission
            git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
        fi
        echo oh my zsh is installed successuflly now!
    else
        echo oh my zsh installation is skipped!
    fi
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
        git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete &&
        echo Plugins of oh my zsh are installed successfully!
else
    echo Plugins of oh my zsh installation is skipped!
fi

#--------    The theme of oh my zsh: Powerlevel10k     --------
read -p "Install Powerlevel10k? (y/n):" flag_install_powerlevel10k

if [ flag_install_powerlevel10k = "y" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&
        echo 'source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc &&
        echo Powerlevel10k is installed successfully!
else
    echo Powerlevel10k installation is skipped!
fi

#--------    oh my tmux     --------
read -p "Install oh my tmux? (y/n):" flag_install_oh_my_tmux

if [ flag_install_oh_my_tmux = "y" ]; then
    cd ~ &&
        git clone https://github.com/gpakosz/.tmux.git &&
        ln -s -f .tmux/.tmux.conf &&
        cp .tmux/.tmux.conf.local . &&
        echo oh my tmux is installed successfully!
else
    echo oh my tmux installation is skipped!
fi

#--------    Compelling environment  --------

# Install autoconf
if ! which autoconf 1>/dev/null 2>&1; then
    echo autoconf is not installed!

    read -p "Install autoconf (y/n):" flag_install_autoconf

    if [ $flag_install_autoconf = "y" ]; then
        read -p "Install autoconf with sudo (y/n):" flag_way_install_autoconf_with_sudo

        if [ $flag_way_install_autoconf_with_sudo = "y" ]; then
            sudo apt install autoconf
        else
            echo dd
        fi
        echo autoconf is installed now!
    else
        echo autoconf installation is skipped!
    fi
else
    echo autoconf has been installed before!
fi

# Install automake
if ! which automake 1>/dev/null 2>&1; then
    echo automake is not installed

    read -p "Install automake (y/n):" flag_install_automake

    if [ $flag_install_automake = "y" ]; then
        read -p "Install automake with sudo (y/n):" flag_way_install_automake_with_sudo

        if [ $flag_way_install_automake_with_sudo = "y" ]; then
            sudo apt install automake
        else
            echo dd
        fi
        echo automake is installed now!
    else
        echo automake installation is skipped!
    fi
else
    echo automake has been installed before!
fi

# Install pkg-config
if ! which pkg-config 1>/dev/null 2>&1; then
    echo pkg-config is not installed

    read -p "Install pkg-config (y/n):" flag_install_pkg_config

    if [ $flag_install_pkg_config = "y" ]; then
        read -p "Install pkg-config with sudo (y/n):" flag_way_install_pkg_config_with_sudo

        if [ $flag_way_install_pkg_config_with_sudo = "y" ]; then
            sudo apt install pkg-config
        else
            echo dd
        fi
        echo pkg-config is installed now!
    else
        echo pkg-config installation is skipped!
    fi
else
    echo pkg-config has been installed before!
fi

# Install libtool
if ! whereis pkg-config 1>/dev/null 2>&1; then
    echo libtool is not installed

    read -p "Install libtool (y/n):" flag_install_libtool

    if [ $flag_install_libtool = "y" ]; then
        read -p "Install libtool with sudo (y/n):" flag_way_install_libtool_with_sudo

        if [ $flag_way_install_libtool_with_sudo = "y" ]; then
            sudo apt install libtool
        else
            echo dd
        fi
        echo libtool is installed now!
    else
        echo libtool installation is skipped!
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
        read -p "Install ctags with sudo (y/n):" flag_way_install_universal_ctags_with_sudo

        if [ $flag_way_install_universal_ctags_with_sudo = "y" ]; then
            sudo apt install universal-ctags
        else
            cd ~/download &&
                if [ ! -e ./ctags ]; then
                    git clone https://github.com/universal-ctags/ctags.git
                fi &&
                cd ctags &&
                ./autogen.sh &&
                ./configure --prefix=$HOME/opt/ctags && # set the installation directory, defaults to /usr/local
                make &&
                make install
        fi
    else
        echo universal ctags installation is skipped!
    fi
    echo universal ctags is installed successuflly now!
else
    echo universal ctags has been installed before!
fi

# Install and update node.js, install nodejs package manager, the links are https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04, https://linuxgenie.net/how-can-i-update-my-nodejs-to-the-latest-version-on-ubuntu/
if ! which nodejs 1>/dev/null 2>&1; then
    echo nodejs is not installed!

    # Install universal ctags which tagbar requires
    read -p "Install nodejs (y/n):" flag_install_nodejs

    if [ $flag_install_nodejs = "y" ]; then
        # Enter the decision to determine whether to install it from sourcecode in command line
        read -p "Install ctags with sudo (y/n):" flag_way_install_nodejs_with_sudo

        if [ $flag_way_install_nodejs_with_sudo = "y" ]; then
            # Install nodejs
            sudo apt install nodejs &&

                # Install nodejs manager npm
                sudo apt install npm &&

                # Update nodejs
                sudo npm cache clean -f &&
                sudo npm install -g n &&
                sudo n stable
        else
            cd ~/opt &&
                nodev=$(wget -qO- https://nodejs.org/dist/latest/ | sed -nE 's|.*>node-(.*)\-linux-x64.tar\.gz</a>.*|\1|p') &&
                curl "https://nodejs.org/dist/${nodev}/node-${nodev}-linux-x64.tar.xz" >"node-${nodev}-linux-x64.tar.gz" &&
                if [ ! -d ./node ]; then
                    mkdir node
                fi &&
                tar -xf node-${nodev}-linux-x64.tar.gz -C ./node --strip-components 1
        fi
    else
        echo nodejs installation is skipped!
    fi
    echo nodejs is installed successuflly now!
else
    echo nodejs has been installed before!
fi

#--------    Vim plugins manager called vim-plug    --------

# Install the vim plugins manager called vim-plug
if [ ! -e ~/.vim/autoload/plug.vim ]; then
    echo -e "\033[31m Vim plugin manager called vim-plug is not installed! \033[0m"

    read -p "Install vim plugin manager called vim-plug? (y/n):" flag_install_vim_plug

    if [ $flag_install_vim_plug = "y" ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        echo Vim plugin manager called vim-plug installation is skipped!
    fi
else
    echo -e "\033[31m Vim plugins manager called vim-plug has been installed before! \033[0m"
fi

#--------    Plugins of Vim     --------
