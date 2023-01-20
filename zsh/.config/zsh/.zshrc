export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.
export _Z_DATA="$ZDOTDIR/.z"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH" # add code to path
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH" # add openjdk to path
export PATH="/Applications/MATLAB_R2022b.app/bin:$PATH"
export PATH="$PATH:/Users/tiny/Library/Application Support/JetBrains/Toolbox/scripts" # Added by Toolbox App
export EDITOR="vi"

alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gr="git rebase -i"
alias python='python3'
alias matlab="matlab -nodisplay -nosplash -nodesktop"
alias ls='ls -G'

zstyle ':omz:update' mode disabled  # disable automatic updates
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_CUSTOM=$ZDOTDIR/custom

plugins=(
    z
    vi-mode
)

source $ZSH/oh-my-zsh.sh
