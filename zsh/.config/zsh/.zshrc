# Exports
export ZSH="$HOME/.oh-my-zsh"
export _Z_DATA="$ZDOTDIR/.z"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH" # add code to path
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH" # add openjdk to path
export PATH="/Applications/MATLAB_R2022b.app/bin:$PATH"
export PATH="$PATH:/Users/tiny/Library/Application Support/JetBrains/Toolbox/scripts" # Added by Toolbox App
export PATH="$PATH:$HOME/projects/information-retrival/search_exercise/elasticsearch-7.17.5/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export EDITOR='vim'
export SPARK_HOME="/opt/homebrew/Cellar/apache-spark/3.5.0/libexec"
export JAVA_OPTS='--add-exports java.base/sun.nio.ch=ALL-UNNAMED'
export JAVA_HOME=$(/usr/libexec/java_home)

# HISTFILE=".histfile"             # Save 100000 lines of history
HISTSIZE=100000
SAVEHIST=100000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_CUSTOM=$ZDOTDIR/custom

# Plugins
plugins=(git z vi-mode zsh-autosuggestions zsh-syntax-highlighting aliases alias-finder)

zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default

VI_MODE_SET_CURSOR=false

source $ZSH/oh-my-zsh.sh
source $HOME/fzf-git.sh

#Aliases
alias python='python3'
alias matlab="matlab -nodisplay -nosplash -nodesktop"
alias l="ls -CAF --color=auto"
alias ls="ls -CAF --color=auto"
alias grep="grep --color=auto"
alias gs='git status'
alias hrep='history | grep '
alias cat='bat'

eval "$(fzf --zsh)"
eval "$(~/.local/bin/mise activate zsh)"

function tn() {
    if [ -n "$1" ]
      then
         tmux switch -t $1
      else
         echo "no session name"
     fi
}
function tmux_web() {
  SESSION_NAME=$1

	if tmux has-session -t $SESSION_NAME 2>/dev/null; then
		echo "Session found. Attaching to session '$SESSION_NAME'."
		tmux attach -t $SESSION_NAME
	else
		echo "Session not found. Creating session '$DIR_NAME'."
    tmux new -s $SESSION_NAME 
    tmux new-window -t $SESSION_NAME
    tmux new-window -t $SESSION_NAME
    tmux select-window -t $SESSION_NAME:2
    tmux attach -t $SESSION_NAME
	fi
}

function tmux.() {
	# Get the current directory name for the new session base name
	DIR_NAME=${PWD:t}
  tmux_web $DIR_NAME
	echo "Tmux session '$DIR_NAME' started."
}
#
# 

# A Colorful Prompt with OS Version
set -o promptsubst
autoload -Uz colors
colors
bg1='#259'; bg2='238'; bg3='236'; bg4='#fff';
fg1='#cee'; fg2='#ccc'; fg3='248'; fg4='#000';
PROMPT_HOSTNAME="%K{$bg1}%F{$fg1} %n %K{$bg2}%F{$bg1}"
PROMPT_OS_AND_KERNEL="%K{$bg2}%F{$fg2}%m %(!.%K{red}%F{$bg2}.%K{$bg3}%F{$bg2})"
PROMPT_DIRECTORY="%(!.%K{red}%F{white}.%K{$bg3}%F{$fg3})%1~ %(!.%k%F{red}.%k%F{$bg3})"
PROMPT='${PROMPT_HOSTNAME} ${PROMPT_OS_AND_KERNEL} ${PROMPT_DIRECTORY}%f%k '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

