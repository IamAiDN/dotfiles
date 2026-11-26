#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

dotsync() {
    local msg="${*:-Update dotfiles}"
    git -C "$HOME/dotfiles" add -A && \
    git -C "$HOME/dotfiles" commit -m "$msg" && \
    git -C "$HOME/dotfiles" push
}
