# The set for zsh installed by source without sudo right
[ -f $HOME/opt/zsh/bin/zsh ] && exec $HOME/opt/zsh/bin/zsh -l
export PATH=$PATH:$HOME/opt/zsh/bin
