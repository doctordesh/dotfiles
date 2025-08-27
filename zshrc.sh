# ##################################################
# Oh my zsh installation

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Disable theme, use 'pure'
ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh


# ##################################################
# User configuration

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Hostname always present in env
export HOSTNAME=`hostname`

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# exports
export EDITOR=emacs
export PATH=$PATH:~/bin
export PATH=$PATH:$HOME/Development/go/bin
export TERM=xterm

alias resource="source ~/.zshrc"
alias ks="ksync"
alias dev="cd ~/Development"
alias etd="cd ~/Development/EISCAT/e3d"
alias pwdc="pwd | tr -d '\n' | pbcopy"
alias tmp="cd ~/tmp"
alias venv="source ./.venv/bin/activate"
alias cvenv="python -m venv .venv; venv"
alias ls="eza" # brew install eza
alias cat="bat" # brew install bat
alias j="just"

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

# Setup 'pure'
fpath+=("$(brew --prefix)/share/zsh/site-functions")

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
