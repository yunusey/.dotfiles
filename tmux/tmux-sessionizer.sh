#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/ ~/yunusey ~/.config/nvim/lua/ -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
# For some reason, when I open a directory with '.' in the prefix, it writes '_' instead.
# So, if there's this character in the beginning, set name as selected_name[1:].
first_char=${selected_name:0:1}
if [ "$first_char" = "_" ]; then
    selected_name=${selected_name:1}
fi
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
