# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bindings.sh ]; then
    . ~/.bindings.sh
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Terminal coloring
git_branch() {
    a=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ "$a" == "" ] 
    then
	echo "null"
    else
	echo $a
    fi
}

current_dir() {
    a=`pwd`
    cre=${a:12}
    if [ "$a" == "/home/yucely" ]
    then
	echo '🏠'
    else
	echo "~$cre"
    fi
}

# PS1='\[\e[0;38;5;154m\]\T \[\e[0m\]> \[\e[0;1;38;5;197m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0m\]> \[\e[0;38;5;45m\]\w \[\e[0m\]$ \[\e[0m\]'

# Cursor color
termcol="\[\e[0;38;2;255;255;255m\]"

# Header color
headcol="100;0;100"
# Header text
headtxt="May God bless our  brotherhood!"
# Header prompt in total
headerp="\[\e[0;38;2;""$headcol""m\]\[\e[0m\]\[\e[0;48;2;""$headcol""m\]"$headtxt"\[\e[0m\]\[\e[0;38;2;""$headcol""m\]\[\e[0m\]"

headerp="" # I don't want to delete eveerything I did before, so for now, just assign it to an empty string.

# Header2 color
headcol2="254;80;0"
# Header2 text
headtxt2="  on  with  "
# header2 prompt in total
header2p="\n\[\e[0;38;2;""$headcol2""m\]\[\e[0m\]\[\e[0;48;2;""$headcol2""m\]"$headtxt2"\[\e[0m\]\[\e[0;38;2;""$headcol2""m\]\[\e[0m\] "

# Git color
gitcol="255;0;0"
# Git text
gittxt='  $(git_branch) '
# Git prompt in total
gitp=" \[\e[0;38;2;""$gitcol""m\]\[\e[0m\]\[\e[0;48;2;""$gitcol""m\]"'\[\e[0;48;2;'$gitcol'm\]'$gittxt'\[\e[0m\]'"\[\e[0m\]\[\e[0;38;2;""$gitcol""m\]\[\e[0m\]"

# Folder background color
foldercol="0;0;0"
# Folder foreground color
folderfcol="0;255;255"
# Folder text
foldertxt=' $(current_dir) \[\e[0m\]'
# Folder prompt in total
folderp=" \[\e[0;38;2;""$foldercol""m\]\[\e[0m\]\[\e[0;48;2;""$foldercol""m\]"'\[\e[0;48;2;'$foldercol';38;2;'$folderfcol'm\]'$foldertxt'\[\e[0m\]'"\[\e[0m\]\[\e[0;38;2;""$foldercol""m\]\[\e[0m\]"
export PS1=$header2p$headerp$gitp$folderp$termcol'\n\n'
# export PS1='\[\e[0;38;5;154m\] \T\[\e[0m\] $spcolor> \[\e[0m\]\[\e[0;1;38;5;197m\] $(git_branch) \[\e[0m\]$spcolor> \[\e[0m\]\[\e[0;38;5;45m\] $(current_dir) \[\e[0m\]\n'

export VISUAL=vim
export EDITOR="$VISUAL"

. "$HOME/.cargo/env" # Rustup
