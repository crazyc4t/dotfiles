#░█▀▀░█▀▄░█▀█░▀▀█░█░█░█▀▀░█░█░▀█▀
#░█░░░█▀▄░█▀█░▄▀░░░█░░█░░░░▀█░░█░
#░▀▀▀░▀░▀░▀░▀░▀▀▀░░▀░░▀▀▀░░░▀░░▀░
#----https://saidneder.tech-----#
#--https://github.com/crazyc4t--#
#-------- config.fish ----------#


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Removing greeter
set -g fish_greeting

# Starship prompt
starship init fish | source

alias ls="lsd -lra"
alias cat="bat"
alias nv="nvim"
alias vi="nvim"
alias vim="nvim"
alias sudo="doas"
alias sudoedit="doas nvim"
alias pac="paru"
alias nodisturb="dunstctl set-paused toggle"
# autostart commands 
pfetch
