PROMPT=$'%{$fg[white]%} %{$fg_bold[green]%}%~ %{$reset_color%}$(git_prompt_info)\
%{$fg[blue]%}%$'%n'%{$fg[red]%} ➜ %{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}*%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# right prompt
RPROMPT=%D{%H:%M:%S}
