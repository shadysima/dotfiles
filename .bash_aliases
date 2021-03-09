#    _               _             _ _                     
#   | |__   __ _ ___| |__     __ _| (_) __ _ ___  ___  ___ 
#   | '_ \ / _` / __| '_ \   / _` | | |/ _` / __|/ _ \/ __|
#   | |_) | (_| \__ \ | | | | (_| | | | (_| \__ \  __/\__ \
#   |_.__/ \__,_|___/_| |_|  \__,_|_|_|\__,_|___/\___||___/
#                                                          

alias v="nvim"
alias vb="nvim ~/.bashrc"
alias sb="source ~/.bashrc"
alias cc="clear"
alias pr="sudo pacman -Rs" # pacman remove (pkg + dependencies)
alias pu="sudo pacman -Syu" # pacman upgrade
alias pi="sudo pacman -S" # pacman install
alias pil="sudo pacman -U" # pacman install local
alias ps="sudo pacman -Ss" # pacman search
alias pinfo="sudo pacman -Qi" # pacman info (about a certain pkg)
alias pq="sudo pacman -Q" # pacman query
alias po="sudo pacman -Qtd" # pacman orphan (queries orphaned packages)
alias pro="sudo pacman -Rsn $(pacman -Qtdq)" # pacman remove orphans
alias se="sudo systemctl enable"
alias ss="sudo systemctl start"
alias sr="sudo systemctl restart"
alias sst="sudo systemctl status"
alias ga="git add"
alias gaa="git add -A"
alias gcmsg="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git status"
alias cdh="cd ~/"
alias cdd="cd ~/downloads/"
alias cdp="cd ~/pictures/"
alias cdc="cd ~/.config/"
alias cds="cd ~/source/"
alias cdo="cd /opt/"
alias cdk="cd ~/.config/kitty/"
alias cdw="cd ~/workspace/"
alias rmg="rm -rf .git/"
alias cdlsa="cd ~/.local/share/applications"
alias lls="ls -lh"
alias lla="ls -ah"
alias llas="ls -ahl"
alias n="neofetch"
alias y="ytop"
alias p="pfetch"
alias tt="tty-clock -sct"
alias vst="nvim ~/.config/st/config.h"
alias vd="nvim ~/source/dwm/src/dwm-6.2/config.h"
alias shutdon="shutdown now"
alias vq="nvim ~/.config/qtile/config.py"
alias vbs="nvim ~/.config/bspwm/bspwmrc"
alias vs="nvim ~/.config/sxhkd/sxhkdrc"w
alias xx="xrdb ~/.Xresources"
