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
export plugins=(zsh-autosuggestions tmux git zsh-syntax-highlighting vi-mode)
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

alias l="ls"
alias c="clear"
alias e="exit"
alias s="ssh"

alias v="vim"
alias vz="vim $HOME/.zshrc"
alias vv="vim $HOME/.vimrc"

alias r="ranger"
alias y="yadm"
alias ys="yadm status"
alias ya="yadm add"
alias yc="yadm commit"
alias yp="yadm push"
alias yd="yadm diff"

alias py="python3"
alias ipy="ipython"

alias venv="source ./.venv/bin/activate"
alias lldb="lldb -s ~/.lldbrc"

#
# Sources
#
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh || true
[ -f $HOME/.custom.zsh ] && source $HOME/.custom.zsh || true
