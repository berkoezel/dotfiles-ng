# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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
export QT_QPA_PLATFORMTHEME=gtk2
. "$HOME/.cargo/env"
PATH="$HOME/.local/bin${PATH:+:${PATH}}"

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$PATH:/usr/lib/jvm/java-11-openjdk-amd64/bin/
export PATH="$PATH":"$HOME/.local/bin"
export PATH="$PATH":$HOME/.gobin
export GOPATH="$HOME/go"
export CLASSPATH=$JUNIT_HOME/junit-4.10.jar

export GO111MODULE=on
