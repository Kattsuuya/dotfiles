# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/bash_profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.pre.bash"
if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi
export HISTCONTROL=ignoredups

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

export HOMEBREW_NO_AUTO_UPDATE=1

# macOSの場合、zlibのパスをコンパイラに伝える
if [ "$(uname)" == "Darwin" ] ; then
    export LDFLAGS="-L/usr/local/opt/zlib/lib"
    export CPPFLAGS="-I/usr/local/opt/zlib/include"
fi
. "$HOME/.cargo/env"
export BASH_SILENCE_DEPRECATION_WARNING=1

eval $(/opt/homebrew/bin/brew shellenv)

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && builtin source "$HOME/.fig/shell/bash_profile.post.bash"
