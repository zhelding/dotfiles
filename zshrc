export EDITOR=vim
export TERM="xterm-256color"

export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

# Move cursor with ctrl-a / ctrl-e
bindkey -v
export KEYTIMEOUT=1

# Shell history settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Autocomplete setup
autoload -Uz compinit
compinit

# Enable powerlevel9k theme
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host vi_mode dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

# Import colorscheme from pywal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors.sh

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="BASECFLAGS=-U_FORTIFY_SOURCE"
export LDFLAGS="-L/usr/lib/openssl-1.0"
export CFLAGS="-I/usr/include/openssl-1.0"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Auto ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-info
fi

if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(head -2 ~/.ssh-agent-info)"
fi

# Define aliases
alias gaps="i3-msg 'gaps inner all set 10'"
alias nogaps="i3-msg 'gaps inner all set 0'"

alias ls="ls --color=auto"
alias transp="toggle-transparency"
alias deorphan='[[ -n $(yay -Qtd) ]] && yay -Rns $(yay -Qtdq) || echo "No" \
                "orphans to remove"'
alias startemis="aws ec2 start-instances --instance-ids i-048a83011cc3bc0d1"

# BEGIN vivian
#alias multimon="toggle-multimonitor"
# END vivian

# Define functions
function tmux-help () {
    cat ~/wiki/'tmux cheatsheet.wiki' | grep $1
}

function pomo () {
    if [ -z $1 ]; then
        echo '25 5' > ~/.pomodoro_session
    elif [ "$1" = "r" ]; then
        rm ~/.pomodoro_session
    elif [ -z $2 ]; then
        echo $1 ' 5' > ~/.pomodoro_session
    else
        echo $1 ' ' $2 > ~/.pomodoro_session
    fi
}
