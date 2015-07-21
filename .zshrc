# -------
## .zshrc
# -------

# -------
# options
# -------
setopt prompt_subst
export EDITOR='vim'

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
# paths
# -------
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# -------
# source all my dotfiles
# -------
for file in ~/.{env,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# -------
# sweet function to set window title
# -------
echo -ne "\e]1;${PWD##*/}\a"
#precmd () { echo -ne "\e]1;${PWD##*/}\a" }

# -------
# venv stuff
# -------
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# -------
# heroku toolbelt stuff..
# -------
export PATH="/usr/local/heroku/bin:$PATH"

# -------
# prompt customization
# -------
autoload -U promptinit
promptinit

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

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
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

# git status in prompt
GIT_PROMPT_SYMBOL="%{$fg[yellow]%}±"
GIT_PROMPT_PREFIX="%{$fg[yellow]%} %{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}∆%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}u%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}d%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}s%{$reset_color%}"

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
    [ -n "$git_where" ] && echo "on %{$fg[blue]%}${git_where#(refs/heads/|tags/)}$(parse_git_state)"
}

# left prompt
PROMPT='%{$fg_bold[green]%}%~%{$reset_color%} $(git_prompt_string)$(prompt_char)'$'\n''%{$fg[blue]%}%$%n%{$fg[white]%}@%{$reset_color%}%{$fg[blue]%}$(box_name)%{$reset_color%} %{$fg[magenta]%}%#%{$reset_color%} '
# removed right prompt for now
#RPROMPT="%{$fg[white]%}%*%{$reset_color%}"
RPROMPT='%{$fg[white]%}$(virtualenv_info)%{$reset_color%}'
