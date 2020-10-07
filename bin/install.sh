#!/usr/bin/env bash
set -ue

helpmsg() {
    command echo "Usage: $0 [--help | -h]" 0>&2
    command echo ""
}

cp_vscode_settings() {
    local dotdir=$(dirname ${script_dir})
    local dst="$dotdir/settings.json"
    if [ "$(uname)" == 'Darwin' ]; then
        local OS='Mac'
        local src="$HOME/Library/Application Support/Code/User/settings.json"
    elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
        local OS='Linux'
        local src="$HOME/.config/Code/User/settings.json"
    elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
        local OS='Cygwin'
        local src="%APPDATA%/Code/User/settings.json"
    else
        echo "Your platform ($(uname -a)) is not supported."
        exit 1
    fi
    if [[ -L "$src" ]]; then
        command rm -f "$src"
    fi
    if [[ -e "$src" ]]; then
        command mv "$src" "${src}_bk"
    fi
    command ln -snf $dst "$src"
}

link_to_homedir() {
    command echo "backup old dotfiles..."
    if [ ! -d "$HOME/.dotbackup" ]; then
        command echo "$HOME/.dotbackup not found. created automatically."
        command mkdir "$HOME/.dotbackup"
    fi
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
    local dotdir=$(dirname ${script_dir})
    if [[ "$HOME" != "$dotdir" ]]; then
        for f in $dotdir/.??*; do
            [[ `basename $f` == ".git" ]] && continue
            if [[ -L "$HOME/`basename $f`" ]]; then
                command rm -f "$HOME/`basename $f`"
            fi
            if [[ -e "$HOME/`basename $f`" ]]; then
                command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
            fi
                command ln -snf $f $HOME
        done
        cp_vscode_settings
    else
        command echo "same install src dest"
    fi
}

while [ $# -gt 0 ]; do
    case ${1} in
        --debug|-d)
            set -uex
            ;;
        --help|-h)
            helpmsg
            exit 1
            ;;
        *)
            ;;
    esac
    shift
done

link_to_homedir
git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Installation completed ! \e[m"

