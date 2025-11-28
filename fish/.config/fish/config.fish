source ~/.dotfiles/fish/.config/fish/aliases.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting
set fish_color_command green
set -gx EDITOR nvim
set -gx BROWSER /usr/bin/chromium

fish_default_key_bindings

fzf --fish | source
zoxide init fish | source
starship init fish | source
