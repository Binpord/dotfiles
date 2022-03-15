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
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
    export ZSH_TMUX_AUTOSTART=true
fi

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

if [ -d $HOME/bin ]; then
    export PATH="$PATH:$HOME/bin"
fi

[ -f $HOME/.conda.zsh ] && source $HOME/.conda.zsh || true
[ -f $HOME/.custom.zsh ] && source $HOME/.custom.zsh || true

