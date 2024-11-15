if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q tmux
    if not test -n "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
    end
end

alias cat="bat"
alias ll="eza -l -g --icons"
alias la="ll -a"
alias ls="eza"
alias lsa="eza"

fish_add_path /opt/homebrew/bin

zoxide init fish | source
starship init fish | source
fzf --fish | source
