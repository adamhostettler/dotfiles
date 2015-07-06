PROMPT=$'%{$fg[white]%} %{$fg_bold[green]%}%~ %{$reset_color%}$(git_prompt_info)\
%{$fg[magenta]%}%$'%n'%{$fg[magenta]%}➜ %{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# right prompt
RPROMPT=%D{%H:%M:%S}
