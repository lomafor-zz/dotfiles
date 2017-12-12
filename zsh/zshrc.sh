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

export WORKSPACE_PATH=$HOME/workspace
export GOPATH=$WORKSPACE_PATH/go
export CDPATH=$CDPATH:$HOME:$WORKSPACE_PATH

# History
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

# Disable Ctrl-S for Vim's save-file binding
stty -ixon

# }}}
# Alias {{{

alias lss='ls -AlhtG'
alias v='vim -p'

alias a-edit-zshrc="vim ~/.zshrc"
alias a-edit-vimrc="vim ~/.vimrc"
alias a-source-zshrc="source ~/.zshrc"

alias a-ssh-base='ssh root@dragonbase'
alias a-ssh-base-main='ssh root@dragonbase_main'

alias a-find-dir="find ./ -type d | sed -e 's/[^-][^\/]*\//--/g;s/--/ |-/'"
alias a-kill-java='ps -ef | grep java | grep -v grep | grep -v CrashPlanService | awk "{print \$2}" | xargs kill -9 && echo "All Java are dead, for now..."'
alias a-ps-java='ps -ef | grep java | grep -v grep | grep -v CrashPlan'

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
source ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# }}}
# Enhancements {{{

# Change cursor when ZSH VI mode changes between normal and insert
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}
function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# }}}

# vim:foldmethod=marker:foldlevel=0
