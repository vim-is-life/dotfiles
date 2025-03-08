# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '/home/shark/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

if [ -f "$HOME/.dircolors" ]; then
    eval "$(dircolors ~/.dircolors)"
else
    filetxt='OTHER_WRITABLE 30;41 # dir that is other-writable (o+w) and not sticky'
    echo "$filetxt" >"$HOME/.dircolors"
    eval "$(dircolors ~/.dircolors)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U colors && colors # Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}"
NEWLINE=$'\n'
PS1="${PS1}${NEWLINE}%# "

# File sourcing
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/shell/env_vars
source ~/.config/shell/funcs
source ~/.config/shell/bash_and_zsh_aliases
neofetch
