export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export FZF_DEFAULT_OPTS='--layout=reverse'
export PATH="$HOME/Projects/ghidra/ghidraRun:$PATH"

# Settings
# HISTFILE=".histfile"             # Save 100000 lines of history
HISTSIZE=100000
SAVEHIST=100000
setopt BANG_HIST            # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY     # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY        # Share history between all sessions.
setopt HIST_IGNORE_DUPS     # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE    # Don't record an entry starting with a space.


zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes   # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes    # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes  # disabled by default

plugins=(
    git
    z
    vi-mode
    fzf
    zsh-autosuggestions
    zsh-syntax-highlighting
    aliases
    alias-finder
    vscode
)

# omz settings
DISABLE_UNTRACKED_FILES_DIRTY="true"
VI_MODE_SET_CURSOR=false

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
eval "$(~/.local/bin/mise activate zsh)"

# Theme
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
PROMPT='%n@%m:%F{cyan}%~%f${vcs_info_msg_0_}$ '
