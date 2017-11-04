#########
# LOCAL #
#########

export DROPBOX_PATH=$HOME/Downloads/Dropbox
export WORKSPACE_PATH=$HOME/workspace
export GOPATH=$WORKSPACE_PATH/go
export MY_BIN=$HOME/.bin
export PATH=$MY_BIN:$PATH 

alias a-ssh-base='ssh root@dragonbase'
alias a-ssh-base-main='ssh root@dragonbase_main'
alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

##########
# SHARED #
##########

source $DROPBOX_PATH/AppData/zshrc_common
