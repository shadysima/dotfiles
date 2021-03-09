#            __              __           _                _      
#      _____/ /_  ____ _____/ /_  _______(_)___ ___  ____ ( )_____
#     / ___/ __ \/ __ `/ __  / / / / ___/ / __ `__ \/ __ `/// ___/
#    (__  ) / / / /_/ / /_/ / /_/ (__  ) / / / / / / /_/ / (__  ) 
#   /____/_/ /_/\__,_/\__,_/\__, /____/_/_/ /_/ /_/\__,_/ /____/  
#                          /____/                                 
#       _____      __                        _____      
#      / __(_)____/ /_     _________  ____  / __(_)___ _
#     / /_/ / ___/ __ \   / ___/ __ \/ __ \/ /_/ / __ `/
#    / __/ (__  ) / / /  / /__/ /_/ / / / / __/ / /_/ / 
#   /_/ /_/____/_/ /_/   \___/\____/_/ /_/_/ /_/\__, /  
#                                              /____/   

# AUTOSTART
neofetch

# USER ADDED ABBREVIATIONS
abbr --add vfish "nvim ~/.config/fish/config.fish"
abbr --add vbash "nvim ~/.bashrc"
abbr --add sfish "source ~/.config/fish/config.fish"
abbr --add sbash "source ~/.bashrc"
abbr --add lls "ls -l"
abbr --add lla "ls -a"
abbr --add llas "ls -al"
abbr --add cc "clear"
abbr --add dr "sudo dnf remove"
abbr --add du "sudo dnf update"
abbr --add di "sudo dnf install"
abbr --add ss "sudo systemctl start"
abbr --add sr "sudo systemctl restart"
abbr --add se "sudo systemctl enable"
abbr --add cdh "cd ~/"
abbr --add cdf "cd ~/.config/fish"
abbr --add cda "cd ~/.config/alacritty"
abbr --add cdtf "cd /home/nick/.steam/steam/steamapps/common/Team\ Fortress\ 2/tf/"
abbr --add cdd "cd ~/Downloads"
abbr --add rmg "rm -rf .git/"
abbr --add cdlsa "cd ~/.local/share/applications"


# USER UPDATED PATH
set --export PATH $PATH /sbin /usr/sbin /usr/local/sbin /usr/bin
set --export PATH $PATH $HOME/bin $HOME/bin/noarg
set --export PATH $PATH $HOME/.cargo/bin
set --export PATH $PATH /opt/anaconda3/bin
set --export PATH $PATH /usr/local/go/bin


# OTHER USER UPDATED ENV VARS
set --export EDITOR nvim
set --export BROWSER brave-browser
set --export TERM alacritty


# USER FUNCTIONS
function fish_greeting
end
