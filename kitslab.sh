TMP=`mktemp -t kitslab.sh.XXXXXX`
trap "rm $TMP* 2>/dev/null" 0

# Created by newuser for 5.0.2
# alias py="python3"
# alias python="python3"
# alias pip="pip3"
export PS1="%n@%m : %~ => "


autoload -U colors && colors
if [[ $(hostname -s) = w* ]]; then
    PROMPT="%{$fg[green]%}%n%{$fg[red]%}@%{$fg[white]%}%m %{$fg[red]%}| %{$fg[blue]%}%~%{$reset_color%}"$'\n'"%{$fg[magenta]%}>%{$reset_color%} "
elif [[ $(hostname -s) = b* ]]; then
    PROMPT="%{$fg[green]%}%n%{$fg[red]%}@%{$fg[blue]%}%m %{$fg[red]%}| %{$fg[blue]%}%~%{$reset_color%}"$'\n'"%{$fg[magenta]%}>%{$reset_color%} "
elif [[ $(hostname -s) = g* ]]; then
    PROMPT="%{$fg[green]%}%n%{$fg[red]%}@%{$fg[green]%}%m %{$fg[red]%}| %{$fg[blue]%}%~%{$reset_color%}"$'\n'"%{$fg[magenta]%}>%{$reset_color%} "
fi
#colors

#HISTSIZE=1000
#SAVEHIST=1000
#HISTFILE=~/.zsh_history

export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
alias l="ls -lah"
alias goenv="export PATH=$PATH:/usr/local/go/bin"
alias em="emacs -nw @$"
alias resource="source ~/.zshrc"

function sardenv() {
    source /opt/conda/etc/profile.d/conda.sh
    conda activate sardana
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

# built with 'dircolors'
# seems like dircolors builds this string based on the theme in the terminal or something like that.
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
