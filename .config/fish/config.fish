if status is-interactive
    # Commands to run in interactive sessions can go here
end

# if using tmux
#if type -q tmux
#    if not test -n "$TMUX"
#        tmux attach-session -t default; or tmux new-session -s default
#    end
#end

# if using zellij
#if status is-interactive
#    set -g ZELLIJ_AUTO_ATTACH true
#    eval (zellij setup --generate-auto-start fish | string collect)
#end

set -gx EDITOR nvim

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

alias cat="bat"
alias ll="eza -l -g --icons"
alias la="ll -a"
alias ls="eza"
alias lsa="eza"

fish_add_path /opt/homebrew/bin
fish_add_path ~/.cargo/bin

zoxide init fish | source
starship init fish | source
fzf --fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
