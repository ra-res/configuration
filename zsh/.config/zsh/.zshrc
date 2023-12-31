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

# Themes
# ZSH_THEME="robbyrussell"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$ZDOTDIR/custom

# Plugins
plugins=(git z vi-mode)

# Settings
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_CUSTOM=$ZDOTDIR/custom

source $ZSH/oh-my-zsh.sh

export PROMPT='%F{111}%m:%b%F{2}%~ $%f '

#Aliases
alias python='python3'
alias matlab="matlab -nodisplay -nosplash -nodesktop"
alias l="ls -CAF --color=auto"
alias ls="ls -CAF --color=auto"
alias grep="grep --color=auto"
alias gs='git status'

