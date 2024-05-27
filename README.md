# Install Applications and Configure them on Linux and Windows

## Content

- [Linux](#linux)
  - [Script to install application](#script-to-install-application)
    - [Install application on Ubuntu](#install-application-on-ubuntu)
  - [Backup of configuration file on Linux](#backup-of-configuration-file-on-linux)
    - [Configuration of shell](#configuration-of-shell)
    - [Configuration of Neovim](#configuration-of-neovim)
    - [Configuration of vim](#configuration-of-vim)
    - [Configuration of tmux](#configuration-of-tmux)
    - [Path of application](#path-of-application)
- [Windows](#windows)
  - [Backup of configuration file on Windows](#backup-of-configuration-file-on-windows)
    - [Configuration of Windows terminal](#configuration-of-windows-terminal)
    - [Configuration of PowerShell](#configuration-of-powershell)
  - [Install WSL2 and Linux distribution on it](#install-wsl2-and-linux-distribution-on-it)
  - [Configuration of WSL2](#configuration-of-wsl2)
  - [Uninstall Linux distribution on WSL2](#uninstall-linux-distribution-on-wsl2)
  - [Install Nerd Font](#install-nerd-font)
  - [Install StarShip](#install-starship)
  - [Install and configure Zotero](#install-and-configure-zotero)
- [Application Manual](#application-manual)
  - [Jupyter notebook](#jupyter-notebook)
    - [Vist Jupyter notebook on remote server via local browser](#vist-jupyter-notebook-on-remote-server-via-local-browser)
  - [Git](#git)
  - [GitHub](#github)
    - [Add public key on Linux into GitHub](#add-public-key-on-linux-into-github)
  - [Vim-Plug](#vim-plug)

### Linux

#### Script to install application

##### Install application on Ubuntu

The script install-configure-application-on-ubuntu.sh can be used to install applications and their plugins automatically on Ubuntu/Debian, e.g., zsh, oh my zsh, vim-plug.

#### Backup of configuration file on Linux

##### Configuration of shell

.bashrc and .bashrc_profile are the configuration files of bash on $HOME, and .zshrc are the configuration file of zsh on $HOME.

##### Configuration of Neovim

nvim is the configuration file of Neovim in **.config** on $HOME.

##### Configuration of vim

.vimrc is the configuration file of vim on $HOME.

##### Configuration of tmux

.tmux is the configuration file of tmux on $HOME.

```
tmux source-file ~/.tmux.conf
```

##### Path of application

profile.d is a directory including the paths of applications on $HOME. The paths of applications are in the bash files. When you want to add the paths of applications into .bashrc or .zshrc, you can add the following command in to .bashrc or .zshrc

```
source ~/profile.d/xxx.sh
```

where xxx is the name of application.

### Windows

#### Backup of configuration file on Windows

##### Configuration of Windows terminal

settings.json is the configuration file of Windows terminal on

```
C:\Users\UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
```

##### Configuration of PowerShell

```
C:\User\UserName\.ssh\config
```

```
C:\Users\刘帅\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```
##### Configuration of Starship
```
C:\User\UserName\.config\starship.toml
```

#### Install WSL2 and Linux distribution on it

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

#### Uninstall Linux distribution on WSL2

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

#### Install StarShip

https://www.jianshu.com/p/1b547035f839
https://juejin.cn/post/7122814751603687438
https://starship.rs/config/#prompt

#### Install and configure Zotero

The reference link: https://www.bilibili.com/video/BV1kr4y1k79h/

1. Download Zotero and Zotero Connector
   
   <img src="https://github.com/shuailiu1990/install-configure-application-on-linux-windows/blob/main/figure/screenshot-download-zotero-zotero-connector.png" width="500px">
2. On the website of Nutstore, add Zotero on **Security** of **Settings**
    
   <img src="https://github.com/shuailiu1990/install-configure-application-on-linux-windows/blob/main/figure/screenshot-add-app-nutstore.png" width="1000px">
3. Open Zotero, set up items on **同步** of **首选项** of **编辑**

   <img src="https://github.com/shuailiu1990/install-configure-application-on-linux-windows/blob/main/figure/screenshot-sync-zotero.png" width="500px">
4. 将**C:\Users\刘帅**中的**Zotero文件夹**同步到Nutstore

   <img src="https://github.com/shuailiu1990/install-configure-application-on-linux-windows/blob/main/figure/screenshot-sync-fold-zotero.jpg" width="500px">
5. Install the Zotero plugin Zotfile
   Search the plugin Zotfile on the website https://www.zotero.org/support/plugins, download the .xpi file and install it as below
   
   <img src="https://github.com/shuailiu1990/install-configure-application-on-linux-windows/blob/main/figure/screenshot-install-zotfile-1.png" width="400px">  
   <img src="https://github.com/shuailiu1990/install-configure-application-on-linux-windows/blob/main/figure/screenshot-install-zotfile-2.png" width="550px" height="300px">
   
   After the installation, we should check its settings as below
   
   <img src="https://github.com/shuailiu1990/install-configure-application-on-linux-windows/blob/main/figure/screenshot-setting-zotfile-1.png" width="400px">  
   <img src="https://github.com/shuailiu1990/install-configure-application-on-linux-windows/blob/main/figure/screenshot-setting-zotfile-2.png" width="550px" height="300px">
6. Install the Zotero Plugin PDF Translate as the procedures above.


### Application Manual

#### Jupyter notebook
##### Vist Jupyter notebook on remote server via local browser
1. The first method: 通过SSH远程使用Jupyter notebook
  
    (1). Login the remote server, and type the command as below in the command line
    ```
    jupyter notebook --no-browser --port=8889
    ```
    (2). 在本地机器的terminal中启动SSH
    ```
    ssh -N -f -L localhost:8888:localhost:8889 username@remote-serverIP
    ```
    其中 -N 告诉SSH没有命令要被远程执行; -f 告诉SSH在后台执行; -L 是指定port forwarding的配置, 远端端口是8889, 本地的端口号的8888; username@serverIP为远程服务器的账号与IP.
2. The second method: 利用Jupyter notebook自带的远程访问功能

    (1). Login the remote server, generate the default configure file of Jupyter notebook
    ```
    jupyter notebook --generate-config
    ```
    (2). Generate访问密码
    Input **ipython** or **ipython2**, 设置为Jupyter访问密码, e.g., 235711131719, copy the output string **sha1:xxxxxxxxxxxxx**
    (3). 修改~/.jupyter/jupyter_notebook_config.py中对应行如下(此文件已有下面的语句, 只需要将前面的注释符号删掉即可)
    ```
    c.NotebookApp.ip = '*'                                                                                                                                                
    c.NotebookApp.password = u'sha:ce...刚才复制的那个密文'
    c.NotebookApp.open_browser = False
    c.NotebookApp.port = 8888 #可自行指定一个端口, 访问时使用该端口
    ```
    (4). 在服务器上启动jupyter notebook
    ```
    jupyter notebook --no-browser --ip=remote-serverIP
    ```
    (5). 在本地终端的浏览器的地址栏输入
    ```
    remote-serverIP:8888
    ```

    Note that if your local server 处于校园网外, i.e., 需要通过VPN访问学校内网, 则需要把以上(4)和(5)替换为以下步骤
    (4). Input the command as below on the remote server
    ```
    jupyter notebook --no-browser --port=8889
    ```
    (5). Input the command as below on the local server
    ```
    ssh -N -f -L localhost:8888:localhost:8889 username@remote-serverIP
    ```
    其中 -N 告诉SSH没有命令要被远程执行; -f 告诉SSH在后台执行; -L 是指定port forwarding的配置, 远端端口是8889 (server-lw的默认端口为8950，有时候会被占用，所以要根据提示来设置改端口), 本地的端口号的8888. username@remote-serverIP 用实际的远程帐户和远程地址替换
   
    (6). Input the command in the browser on the local server
    ```
    localhost:8888
    ```
    

#### Git
#### GitHub
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
