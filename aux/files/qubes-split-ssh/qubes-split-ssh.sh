#!/bin/sh
#
# This is the local client listener for the split SSH agent.
#
# Based on qubes-app-split-ssh by Jason Hennessey

QUBES_SSH_USER="{{ user }}"
QUBES_SSH_UID="$(id -u "$QUBES_SSH_USER")"
QUBES_SSH_SOCK="/run/user/$QUBES_SSH_UID/qubes-ssh-agent.sock"
QUBES_SSH_DOMAIN="{{ domain }}"

if [ -n "$QUBES_SSH_UID" ] && [ "$QUBES_SSH_UID" -ne 0 ]; then
    if [ -n "$QUBES_SSH_DOMAIN" ]; then
        rm -f "$QUBES_SSH_SOCK"
        sudo -u "$QUBES_SSH_USER" sh -c \
            "umask u=rw,g=,o= && \
            socat 'UNIX-LISTEN:$QUBES_SSH_SOCK,fork' \
            'EXEC:qrexec-client-vm $QUBES_SSH_DOMAIN qubes.SshAgent' &"
                
        echo "export SSH_AUTH_SOCK='$QUBES_SSH_SOCK'" \
            >/etc/profile.d/qubes-split-ssh.sh
    fi
fi
