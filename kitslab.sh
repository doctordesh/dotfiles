# Created by newuser for 5.0.2
# alias py="python3"
# alias python="python3"
# alias pip="pip3"
export PS1="%n@%m : %~ => "


autoload -U colors && colors
if [[ $(hostname -s) = w-* ]]; then
  PS1="%{$fg[white]%}%n%{$reset_color%}@%{$bg[white]$fg[black]%}%m%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}> "
elif [[ $(hostname -s) = b-* ]]; then
  PS1="%{$fg[white]%}%n%{$reset_color%}@%{$bg[blue]%}%m%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}> "
elif [[ $(hostname -s) = g-* ]]; then
  PS1="%{$fg[white]%}%n%{$reset_color%}@%{$bg[green]%}%m%{$reset_color%} %{$fg[yellow]%}%~ %{$reset_color%}> "
fi
#colors

#HISTSIZE=1000
#SAVEHIST=1000
#HISTFILE=~/.zsh_history

export PATH=~/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
alias l="ls -lah"
alias goenv="export PATH=$PATH:/usr/local/go/bin"
alias em="emacs -nw @$"
