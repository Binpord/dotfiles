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
export ZSH_TMUX_AUTOSTART=false

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
export plugins=()
source $ZSH/oh-my-zsh.sh

#
# Aliases
#
if [[ "$(uname)" == "Darwin" ]]; then
    alias ls="gls -alh --color --group-directories-first"
    alias vim="nvim"
elif [[ "$(uname)" == "Linux" ]]; then
    alias ls="ls -alh --color --group-directories-first"
fi

#
# Sources
#
[ -f $HOME/.custom.zsh ] && source $HOME/.custom.zsh || true

