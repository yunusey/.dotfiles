# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sync_time='sudo hwclock -s'
alias python='python3.9'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


queries="~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/queries/kojl/"
alias goplugins='cd ~/.local/share/nvim/site/pack/packer/start/'
alias ts="tree-sitter"
alias tsup="cp ~/yunusey/tree-sitter-kojl/queries/* $queries"

alias hist="history | less +G"

alias tmux="env TERM=screen-256color tmux"
alias tx="tmux"

alias neovide="~/bin/neovide.exe --wsl"

alias lvim="~/.local/bin/lvim" # Not using, but wanted to put it anyways...

alias cursor='echo -en "\e[?25l\e[2 q\e[6 q\e[?25h"'

alias sessionizer='tmux-sessionizer'
