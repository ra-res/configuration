export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.
export _Z_DATA="$ZDOTDIR/.z"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH" # add code to path
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH" # add openjdk to path
export PATH="/Applications/MATLAB_R2022b.app/bin:$PATH"
export PATH="$PATH:/Users/tiny/Library/Application Support/JetBrains/Toolbox/scripts" # Added by Toolbox App
export PATH="$PATH:/Users/tiny/programming/information-retrival/search_exercise/elasticsearch-7.17.5/bin"
export EDITOR="vi"

alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gr="git rebase -i"
alias python='python3'
alias matlab="matlab -nodisplay -nosplash -nodesktop"
alias ls='ls -G'
zstyle ':omz:update' mode disabled  # disable automatic updates
# ZSH_THEME="eastwood"
ZSH_THEME="af-magic"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_CUSTOM=$ZDOTDIR/custom
VI_MODE_SET_CURSOR=true

plugins=(
    z
    vi-mode
    # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    zsh-autosuggestions
    # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
     zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
