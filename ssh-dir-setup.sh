#!/bin/bash

if [ ! -f '~/.ssh./authorized_keys' ]; then
    mkdir .ssh
    chmod 700 .ssh
    cd .ssh
    echo $1 > authorized_keys
    chmod 600 authorized_keys
    exit #return to root user
    ## Potential options for /etc/ssh/sshd_config:
    ### Change port number: e.g. Port 4444
    ### PermitRootLogin: no
fi

echo "Restarting ssh to use new settings..."
service ssh restart
