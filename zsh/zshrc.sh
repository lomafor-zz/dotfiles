# Oh-My-Zsh {{{

DEFAULT_USER=`whoami`                    # hide user in user@hostname
ZSH_THEME="dracula"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_UPDATE="true"
plugins=(git brew osx)
export ZSH=$HOME/.dotfiles/zsh/oh-my-zsh
source $ZSH/oh-my-zsh.sh

# }}}
# Zsh {{{

CDPATH=$CDPATH:$HOME:$WORKSPACE_PATH

# }}}
# Alias {{{

alias v-zshrc="vim ~/.zshrc"
alias v-vimrc="vim ~/.vimrc"
alias s-zshrc="source ~/.zshrc"
alias h='history'
alias lss='ls -AlhtG'

## Print directories tree
alias find-dir="find ./ -type d | sed -e 's/[^-][^\/]*\//--/g;s/--/ |-/'"

## Kill all java process 
alias kill-java='ps -ef | grep java | grep -v grep | grep -v CrashPlanService | awk "{print \$2}" | xargs kill -9 && echo "All Java are dead, for now..."'

## Print java process
alias ps-java='ps -ef | grep java | grep -v grep | grep -v CrashPlan'

# }}}
# Functions {{{

# Custom CD
my_cd() {
    cd $1;
    ls;
}
alias cd="my_cd"
# }}}

source ~/.dotfiles/zsh/hotkeys.sh
# vim:foldmethod=marker:foldlevel=0
