export PS1='\[\e[34m\]($CONDA_DEFAULT_ENV) \[\e[0m\][\[\e[31m\]\u\[\e[32m\]@\[\e[31m\]\H\[\e[0m\]] \w\n> '

alias l="ls -lah"
alias ll="ls -lah"
alias resource="source /root/.bashrc"

conda activate tangodev

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
