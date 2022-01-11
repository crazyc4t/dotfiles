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

alias ls="exa -lra --icons"
alias cat="bat"
