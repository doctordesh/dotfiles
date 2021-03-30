# Path to your oh-my-zsh installation.
export ZSH="/Users/emil/.oh-my-zsh"

# Disable theme, use 'pure'
ZSH_THEME=""

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# exports
export GO111MODULE=on
export GOPRIVATE=gitlab.maxiv.lu.se
export EDITOR=ec
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:~/bin
export PATH="./:$PATH"
export PYTHONPATH=~/Library/Python/3.7/lib/python/site-packages:$(pythonpath ~/Development)
export GITLAB_API_TOKEN=pT87wDVujnQs9UprBA7X

# Get rid of warnings
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

alias emacs=ec
alias resource="source ~/.zshrc"
alias profile="ec ~/.zshrc"
alias sshconfig="ec ~/.ssh/config"
alias sshhosts="ec ~/.ssh/known_hosts"
alias ws="cd ~/Development/workspaces"
alias ks="ksync"
alias dev="cd ~/Development"
alias pwdc="pwd | tr -d '\n' | pbcopy"
alias tmp="cd ~/tmp"
alias backup="sh ~/bin/backup.sh"
alias eq="sudo pkill -u _coreaudiod"
alias order="python ~/Development/zoomlist/main.py | pbcopy"

# loop 'command' <sleep-time in seconds>
function loop() {
  while true; do
    eval $1;
    echo "";
    sleep $2;
  done
}

function gocover() {
    go test -coverprofile=coverage.out ./...;
    go tool cover -html=coverage.out;
    rm coverage.out;
}

function colors() {
    clear; text="xYz"; # Some test text

    echo -e "\n                40m   41m   42m   43m   44m   45m   46m   47m";

    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
		       '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
		       '  36m' '1;36m' '  37m' '1;37m'; do
	FG=${FGs// /}
	echo -en " $FGs \033[$FG  ${text}  ";
	for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
            echo -en "$EINS \033[$FG\033[${BG} ${text} \033[0m";
	done
	echo;
    done

    echo -e "               black  red  green yello blue  magen cyan  white";
    echo;
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/emil/Development/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/emil/Development/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/emil/Development/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/emil/Development/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/sbin:$PATH"

# Setup 'pure'
fpath+=$HOME/Development/dotfiles/pure

autoload -U promptinit; promptinit

PURE_CMD_MAX_EXEC_TIME=2

zstyle ':prompt:pure:path' color '#6096D2'
zstyle ':prompt:pure:prompt:success' color '#B366BB'
zstyle ':prompt:pure:prompt:error' color '#C94D1C'
zstyle ':prompt:pure:prompt:continuation' color '#B366BB'
zstyle ':prompt:pure:virtualenv' color '#777777'
zstyle ':prompt:pure:git:*' color '#2B896A'
zstyle ':prompt:pure:git:dirty' color '#C77150'
zstyle ':prompt:pure:execution_time' color '#F9A843'

prompt pure

# Activate basic conda
conda activate python36
