# Oh-My-Zsh {{{

ZSH_THEME="dracula"
DEFAULT_USER=`whoami`
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_UPDATE="true"
plugins=(git brew osx python sudo pip gradle history tmux cp colored-man-pages encode64 extract)
export ZSH=$HOME/.dotfiles/zsh/oh-my-zsh
source $ZSH/oh-my-zsh.sh

# }}}
# General {{{

# Paths
export WORKSPACE_PATH=$HOME/workspace
export GDRIVE_PATH=$HOME/Downloads/GDrive
export GOPATH=$WORKSPACE_PATH/go
export CDPATH=$CDPATH:$HOME:$WORKSPACE_PATH:$GDRIVE_PATH
ANDROID_TOOLS="$HOME/Library/Android/sdk/platform-tools"
export BREW_PATH="/usr/local/bin:/usr/local/sbin"
export PATH="$BREW_PATH:$PATH:$ANDROID_TOOLS"

# History
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

# Enable Ctrl-S for VIM's save-file keybinding
stty -ixon

# Use emacs key binding for cli editing
bindkey -e

# }}}
# Alias {{{

alias lll='ls -AlhtG'
alias v='vim -p'

alias a-edit-dotfiles="cd ~/.dotfiles && vim ./"
alias a-config-zshrc="vim ~/.zshrc && source ~/.zshrc"
alias a-config-vimrc="vim ~/.vimrc"
alias a-source-zshrc="source ~/.zshrc"

alias a-ssh-base='ssh root@dragonbase'
alias a-ssh-base-main='ssh root@dragonbase_main'

alias a-find-dir="find ./ -type d | sed -e 's/[^-][^\/]*\//--/g;s/--/ |-/'"
alias a-kill-java='ps -ef | grep java | grep -v grep | grep -v CrashPlanService | awk "{print \$2}" | xargs kill -9 && echo "All Java are dead, for now..."'
alias a-ps-java='ps -ef | grep java | grep -v grep | grep -v CrashPlan'

# }}}
# Functions {{{

# Preview a markdown file
f-view-markdown() {
    pandoc $1 | lynx -stdin
}

# Clean up specific directory or current path by default
f-cleanup() {
    if [ $1 ]; then
        echo "Cleaning up directory: $1";
        rm -rf $1/**;
        rm -rf $1/.*;
        echo "Done";
    fi
}

# }}}
# Imports {{{

source ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# }}}
# Environment {{{

# python
PYTHONDONTWRITEBYTECODE=1
export PYTHONSTARTUP=~/.pythonrc

# exercism.io
export EXERCISM_WORKSPACE=$WORKSPACE_PATH/exercism

# }}}
# vim:foldmethod=marker:foldlevel=0
alias a-config-tmux='vi ~/.tmux.conf'
