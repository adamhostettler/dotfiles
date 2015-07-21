# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/adam/.zshrc'

autoload -U compinit
compinit
# End of lines added by compinstall


# source all my dotfiles
for file in ~/.{env,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# prompt customization
autoload -U promptinit
promptinit

function location {
    echo "archbook" || echo ${SHORT_HOST:-HOST}
}

local current_dir='${PWD/#$HOME/~}'

# colors
autoload -U colors && colors

# left prompt
PROMPT="%{$fg_bold[green]%}%~"$'\n'"%{$fg[blue]%}%$%n%{$fg[white]@%{$reset_color%}%{$fg[blue]%}$(location)%{$reset_color%} %{$fg[magenta]%}%#%{$reset_color%} "
# removed right prompt for now
#RPROMPT="%{$fg[white]%}%*%{$reset_color%}"
