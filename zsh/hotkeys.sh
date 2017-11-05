# cd ..
function go_up() {
    BUFFER="cd .."
    zle accept-line
}
zle -N go_up
bindkey "^k" go_up

# cd ~
function go_home() { 
    BUFFER="cd ~/"$BUFFER
    zle end-of-line
    zle accept-line
}
zle -N go_home
bindkey "^h" go_home

# ls
function list_d() {
    BUFFER="ls"
    zle accept-line
}
zle -N list_d
bindkey "^l" list_d

# add 'sudo'
function add_sudo() {
    BUFFER="sudo "$BUFFER
    zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo
