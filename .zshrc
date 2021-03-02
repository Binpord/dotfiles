# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Environment
#
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"
export KEYTIMEOUT=1
export DISABLE_AUTO_TITLE=true
export ZSH_THEME="powerlevel10k/powerlevel10k"
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

alias y="yadm"
alias yst="yadm status"
alias ya="yadm add"
alias yc="yadm commit"
alias yp="yadm push"
alias yd="yadm diff"

alias py="python3"
alias ipy="ipython"

alias venv="source ./.venv/bin/activate"
alias lldb="lldb -s ~/.lldbrc"

#
# Ranger cd function
# (thanks to ha7ilm https://gist.github.com/ha7ilm/37c4272b1df6fbfdb0df30464252241e)
#
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
alias r="ranger-cd"

#
# Sources
#
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh || true
[ -f $HOME/.custom.zsh ] && source $HOME/.custom.zsh || true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
