if status is-interactive
    set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
    if command -q starship
        starship init fish | source
    end

    if command -q zoxide
        zoxide init fish | source
    end

    function fish_greeting
        if command -q figlet; and command -q lolcat
            figlet "Hi, Felix!" | lolcat
        else
            echo "Hi, Felix!"
        end
    end
end

if test -d "$HOME/.cargo/bin"
    fish_add_path "$HOME/.cargo/bin"
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniconda/base/bin" $PATH
    end
end
# <<< conda initialize <<<
