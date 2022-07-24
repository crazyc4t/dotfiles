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

alias ls="lsd"
alias cat="bat"
alias nv="nvim"
alias vi="nvim"
alias vim="nvim"
alias zyp="sudo zypper"
alias pip="pip3.10"
alias python="python3"

# Auto-start commands 
PF_INFO="ascii title os host kernel shell editor de palette" /usr/bin/pfetch
