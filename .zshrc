#
# Environment
#
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"
export KEYTIMEOUT=1
export DISABLE_AUTO_TITLE=true
export ZSH_THEME="robbyrussell"

#
# Tmux ssh agent forwarding fix
#
# SOCK="$HOME/.ssh/ssh-agent-socket"
# if [[ -a "$SSH_AUTH_SOCK" && "$SSH_AUTH_SOCK" != "$SOCK" ]]; then
#     ln -sf $SSH_AUTH_SOCK $SOCK
# fi
# export SSH_AUTH_SOCK=$SOCK

#
# Oh-my-zsh
#
export plugins=()
source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/binpord/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/binpord/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/binpord/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/binpord/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate main

