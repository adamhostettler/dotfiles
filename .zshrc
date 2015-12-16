# -------
## .zshrc
# -------

# -------
# options
# -------
# no beeping
setopt no_beep
# enable param exp, command subst, and arithmetic exp
setopt prompt_subst
# only show rprompt on current line
setopt transient_rprompt

# -------
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

# -------
# completion
# -------
# case-insensitive autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
compdef g=git

# -------
# source all my dotfiles
# -------
for file in ~/.{env,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# -------
# sweet function to set window title
# -------
echo -ne "\e]1;terminal\a"
#echo -ne "\e]1;${PWD##*/}\a"
#precmd () { echo -ne "\e]1;${PWD##*/}\a" }

# -------
# prompt customization
# -------
autoload -U promptinit
promptinit

#function virtualenv_info {
#    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
#}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

# hostname (box name)
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

local current_dir='${PWD/#$HOME/~}'

# colors
autoload -U colors && colors

# git status in prompt
GIT_PROMPT_SYMBOL="%K{white}%{$fg[yellow]%}±%k"
GIT_PROMPT_PREFIX="%K{white}%{$fg[yellow]%} %{$reset_color%}%k"
GIT_PROMPT_SUFFIX="%K{white}%{$reset_color%}%k"
GIT_PROMPT_AHEAD="%K{white}%{$fg[red]%}ANUM%{$reset_color%}%k"
GIT_PROMPT_BEHIND="%K{white}%{$fg[cyan]%}BNUM%{$reset_color%}%k"
GIT_PROMPT_MERGING="%K{white}%{$fg_bold[magenta]%}∆%{$reset_color%}%k"
GIT_PROMPT_UNTRACKED="%K{white}%{$fg_bold[red]%}u%{$reset_color%}%k"
GIT_PROMPT_MODIFIED="%K{white}%{$fg_bold[yellow]%}d%{$reset_color%}%k"
GIT_PROMPT_STAGED="%K{white}%{$fg_bold[green]%}s%{$reset_color%}%k"

# show git branch
function parse_git_branch() {
    (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# show appropriate git symbols
function parse_git_state() {
    # build from conditional appending
    local GIT_STATE=""

    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_AHEAD" -gt 0 ]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
    fi

    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_BEHIND" -gt 0 ]; then
        GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
    fi

    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
    if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
    fi

    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
    fi

    if ! git diff --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
    fi

    if ! git diff --cached --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
    fi

    if [[ -n $GIT_STATE ]]; then
        echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
    fi
}

# if in a repo then print branch/state
function git_prompt_string() {
    local git_where="$(parse_git_branch)"
    [ -n "$git_where" ] && echo " ${git_where#(refs/heads/|tags/)}$(parse_git_state)"
}

# current left prompt
PROMPT='%K{green} %~ %k%{$fg[green]%}%K{white} %k%{$reset_color%}%K{white}$(git_prompt_string)%k%K{white}$(prompt_char) %k%{$fg[white]%}%{$reset_color%} '
# old prompts
#PROMPT='%{$fg_bold[cyan]%}%~%{$reset_color%} $(git_prompt_string)$(prompt_char) %{$fg[red]%}%#%{$reset_color%} '
#PROMPT='%{$fg_bold[green]%}%~%{$reset_color%} $(git_prompt_string)$(prompt_char)'$'\n''%{$fg[blue]%}%$%n%{$fg[white]%}@%{$reset_color%}%{$fg[blue]%}$(box_name)%{$reset_color%} %{$fg[magenta]%}%#%{$reset_color%} '
#PROMPT='%{$fg_bold[green]%}%~%{$reset_color%} $(git_prompt_string)$(prompt_char)'$'\n''%{$fg[magenta]%}%#%{$reset_color%} '
# removed right prompt for now
#RPROMPT="%{$fg[white]%}%*%{$reset_color%}"
#RPROMPT='%{$fg[white]%}$(virtualenv_info)%{$reset_color%}'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
