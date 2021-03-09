#         _               _           _                 _     
#     ___| |__   __ _  __| |_   _ ___(_)_ __ ___   __ _( )___ 
#    / __| '_ \ / _` |/ _` | | | / __| | '_ ` _ \ / _` |// __|
#    \__ \ | | | (_| | (_| | |_| \__ \ | | | | | | (_| | \__ \
#    |___/_| |_|\__,_|\__,_|\__, |___/_|_| |_| |_|\__,_| |___/
#                           |___/                             
#             _                        __ _       
#     _______| |__     ___ ___  _ __  / _(_) __ _ 
#    |_  / __| '_ \   / __/ _ \| '_ \| |_| |/ _` |
#     / /\__ \ | | | | (_| (_) | | | |  _| | (_| |
#    /___|___/_| |_|  \___\___/|_| |_|_| |_|\__, |
#                                           |___/ 


# PATH TO oh-my-zsh INSTALLATION
export ZSH="/home/nick/.oh-my-zsh"


# THEME
ZSH_THEME="bira"


# PLUGINS
plugins=(
	git
	zsh-syntax-highlighting
	golang
)


# SOURCING oh-my-zsh
source $ZSH/oh-my-zsh.sh



# PATH EXPORTS
export PATH="$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/opt/anaconda3/bin"
export PATH="$PATH:$HOME/.config/vifm/scripts"


# OTHER USER UPDATED ENV VARS
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox


# ARCHIVE EXTRACTION
# usage: ex <file>
function ex ()
{
	if [ -f $1 ]; then
		case $1 in
			*.tar.gz) 	tar xzf $1 	;;
			*.tar.bz2)	tar xjf $1	;;
			*.tar)		tar xf $1	;;
			*.tar.xz)	tar xf $1	;;
			*.zip)		unzip $1	;;
			*)		echo "'$1' cannot be extracted with ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}


# ALIASES
alias v="nvim"
alias e="emacs"
alias vz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias c="clear"
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
alias sd="sudo systemctl disable"
alias sst="sudo systemctl status"
alias cdh="cd ~/"
alias cdd="cd ~/Downloads/"
alias cdp="cd ~/Pictures/"
alias cdc="cd ~/.config/"
alias cds="cd ~/source/"
alias cdo="cd /opt/"
alias cdk="cd ~/.config/kitty/"
alias cdw="cd ~/workspace/"
alias cdws="cd ~/workspace/scripts/"
alias rmg="rm -rf .git/"
alias cdlsa="cd ~/.local/share/applications"
alias lls="ls -l"
alias lla="ls -a"
alias llas="ls -al"
alias n="neofetch"
alias y="ytop"
alias bsh="bashtop"
alias p="pfetch"
alias tt="tty-clock -sct"
alias vst="nvim ~/.config/st/config.h"
alias vd="nvim ~/source/dwm/src/dwm-6.2/config.h"
alias shutdown="shutdown now"
alias vq="nvim ~/.config/qtile/config.py"
alias vb="nvim ~/.config/bspwm/bspwmrc"
alias vs="nvim ~/.config/sxhkd/sxhkdrc"
alias vx="nvim ~/.Xresources"
alias xx="xrdb ~/.Xresources"
alias vpnc="sudo protonvpn c -f"
alias vpnd="sudo protonvpn d"
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# USE VIM KEYS IN TAB COMPLETE MENUS
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
