# Oh-My-Zsh {{{

ZSH_THEME="dracula"                      # theme
DEFAULT_USER=`whoami`                    # hide user in user@hostname
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_UPDATE="true"               # disable auto update

plugins=(git brew osx python vi-mode sudo pip gradle history tmux)

export ZSH=$HOME/.dotfiles/zsh/oh-my-zsh
source $ZSH/oh-my-zsh.sh

# }}}
# General {{{

export CDPATH=$CDPATH:$HOME:$WORKSPACE_PATH

# History
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

# }}}
# Alias {{{

alias v-zshrc="vim ~/.zshrc"
alias v-vimrc="vim ~/.vimrc"
alias s-zshrc="source ~/.zshrc"
alias lss='ls -AlhtG'
alias v='vim -p'

## Print directories tree
alias find-dir="find ./ -type d | sed -e 's/[^-][^\/]*\//--/g;s/--/ |-/'"

## Kill all java process 
alias kill-java='ps -ef | grep java | grep -v grep | grep -v CrashPlanService | awk "{print \$2}" | xargs kill -9 && echo "All Java are dead, for now..."'

## Print java process
alias ps-java='ps -ef | grep java | grep -v grep | grep -v CrashPlan'

# }}}
# Functions {{{

# Custom CD
c() {
    cd $1;
    ls;
}

# }}}
# Imports {{{

source ~/.dotfiles/zsh/hotkeys.sh
source ~/.dotfiles/zsh/oh-my-zsh/lib/history.zsh

# }}}

# vim:foldmethod=marker:foldlevel=0
