# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

exec fish

##!/usr/bin/env /usr/bin/zsh
# ------------------------------------------------------------------------------

if [[ -z ${DBUS_SESSION_BUS_ADDRESS} ]]; then
	if [[ -f ~/.dbus/session-bus/$(dbus-uuidgen --get)-0 ]]; then
		source ~/.dbus/session-bus/$(dbus--uuidgen --get)-0
		export DBUS_SESSION_BUS_ADDRESS
	fi
fi
