export EDITOR=vim

# Move cursor with ctrl-a / ctrl-e
bindkey -e

# Shell history settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Autocomplete setup
autoload -Uz compinit
compinit

# Enable powerlevel9k theme
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

# Import colorscheme from pywal
(cat ~/.cache/wal/sequences &)

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="BASECFLAGS=-U_FORTIFY_SOURCE"
export LDFLAGS="-L/usr/lib/openssl-1.0"
export CFLAGS="-I/usr/include/openssl-1.0"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Define aliases
alias gaps="i3-msg 'gaps inner all set 10'"
alias nogaps="i3-msg 'gaps inner all set 0'"

alias ls="ls --color=auto"
alias transp="toggle-transparency"
