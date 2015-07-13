# custom zsh prompt
# by adam
#
# takes things from fino theme
#
# use with dark bg for best result
#
#


function prompt_char {
      git branch >/dev/null 2>/dev/null && echo "±" && return
        echo '○'
}

function box_name {
        [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-HOST}
}

function location {
    echo "gci-work" || echo ${SHORT_HOST:-HOST}
}

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'

#
# left prompt
PROMPT=⌐$'%{$fg[white]%} %{$fg_bold[green]%}%~ %{$reset_color%}$(git_prompt_info)\
⌙ %{$fg[magenta]%}%$'%n' %{$FG[239]%}at%{$reset_color%} %{$FG[033]%}$(location)%{$reset_color%} %{$fg[magenta]%}➜ %{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[239]%}on%{$reset_color%} %{$FG[033]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"

# right prompt
RPROMPT=%*
