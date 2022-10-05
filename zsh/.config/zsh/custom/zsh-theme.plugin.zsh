PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}ra-res%{$fg[red]%}@%{$fg[white]%}tiny%{$fg[blue]%}] "
PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+='%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[214]}*"
# ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"