# System-wide .profile for sh(1)

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
	[ -r /etc/bashrc ] && . /etc/bashrc
fi
export HISTCONTROL=ignoredups

export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/qemu/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

export SOURCEKIT_TOOLCHAIN_PATH="/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2019-08-05-a.xctoolchain/usr/bin/swift"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/Cellar/bash/5.0.18/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/gems/solargraph-0.39.13/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/gems/rubocop-0.89.0/exe:$PATH"
if [[ -d ~/.rbenv  ]] ; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

export PATH="$HOME/.nodebrew/current/bin:$PATH"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export HOMEBREW_NO_AUTO_UPDATE=1

# pyenvの設定
if [ -d "$HOME/.pyenv" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi
