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
export ZSH_TMUX_AUTOSTART=true

#
# Tmux ssh agent forwarding fix
#
SOCK="$HOME/.ssh/ssh-agent-socket"
if [[ -a "$SSH_AUTH_SOCK" && "$SSH_AUTH_SOCK" != "$SOCK" ]]; then
    ln -sf $SSH_AUTH_SOCK $SOCK
fi
export SSH_AUTH_SOCK=$SOCK

#
# Oh-my-zsh
#
export plugins=(tmux)
source $ZSH/oh-my-zsh.sh

if type nvim > /dev/null; then
    alias vim="nvim -n"
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/binpord/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/binpord/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/binpord/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/binpord/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate main

