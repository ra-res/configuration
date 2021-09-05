parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias ls='ls --color'
alias ..='cd ..'
alias ~='cd ~'
# export PS1='\u:\[\e[33m\]\w\[\e[0m\]\$ '
export PS1="\u: \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export EDITOR='vim'
set -o vi 
set editing-mode vi
set keymap vi
