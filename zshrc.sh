# Path to your oh-my-zsh installation.
export ZSH="/Users/emiros/.oh-my-zsh"

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Disable theme, use 'pure'
ZSH_THEME=""

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Hostname always present in env
export HOSTNAME=`hostname`

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# exports
export GO111MODULE=on
export GOPRIVATE=gitlab.maxiv.lu.se
export EDITOR=emacs
export PATH=$PATH:$HOME/Development/go/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin
export PATH="./:$PATH"
export GITLAB_API_TOKEN=pT87wDVujnQs9UprBA7X
export TANGO_HOST=localhost:10000
export _JAVA_OPTIONS='-Dsun.java2d.xrender=false'

# Get rid of warnings
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

alias resource="source ~/.zshrc"
alias profile="ec ~/.zshrc"
alias sshconfig="ec ~/.ssh/config"
alias sshhosts="ec ~/.ssh/known_hosts"
alias ks="ksync"
alias dev="cd ~/Development"
alias pwdc="pwd | tr -d '\n' | pbcopy"
alias tmp="cd ~/tmp"
alias x11="xhost + ${HOSTNAME}"
alias ca="conda activate"
alias venv="source ./.venv/bin/activate"
alias cvenv="python -m venv .venv; venv"
alias ls="eza" # brew install eza
alias cat="bat" # brew install bat
alias j="just"

function eq() {
    PID=`ps -ef | grep 'eqMac.app' | awk \{'print$2'\} | head -n 1`
    echo "Killing eqMac.app with PID: $PID"
    sudo kill -9 $PID
    PID=`ps -ef | grep 'eqMac.driver' | awk \{'print$2'\} | head -n 1`
    echo "Killing eqMac.driver with PID: $PID"
    sudo kill -9 $PID
    PID=`ps -ef | grep 'eqmac.helper' | awk \{'print$2'\} | head -n 1`
    echo "Killing eqmac.helper with PID: $PID"
    sudo kill -9 $PID
}

# loop 'command' <sleep-time in seconds>
function loop() {
  while true; do
    eval $1;
    echo "";
    sleep $2;
  done
}

function tloop() {
    for i in $(seq 1 1 $2)
    do
	eval $1
    done
}

function gocover() {
    go test -coverprofile=coverage.out ./...;
    go tool cover -html=coverage.out;
    rm coverage.out;
}

function count() {
    find . -name "*.$1" | xargs wc -l
}

function colors() {
    text="xYz"; # Some test text

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
__conda_setup="$('/Users/emiros/Development/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/emiros/Development/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/emiros/Development/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/emiros/Development/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/sbin:$PATH"

# Setup 'pure'
# fpath+=$HOME/Development/personal/dotfiles/pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit

PURE_CMD_MAX_EXEC_TIME=2

zstyle :prompt:pure:path color '#6096D2'
zstyle :prompt:pure:prompt:success color '#B366BB'
zstyle :prompt:pure:prompt:error color '#C94D1C'
zstyle ':prompt:pure:prompt:continuation' color '#B366BB'
zstyle ':prompt:pure:virtualenv' color '#777777'
zstyle ':prompt:pure:git:*' color '#2B896A'
zstyle ':prompt:pure:git:dirty' color '#C77150'
zstyle ':prompt:pure:execution_time' color '#F9A843'

prompt pure

# Activate basic conda
# conda activate py311
# export PATH="/usr/local/opt/ansible@2.9/bin:$PATH"
