#!/bin/bash

USER_NAME=${LOCAL_USER_NAME:-devuser}
GROUP_NAME=${LOCAL_GROUP_NAME:-devuser}
USER_ID=${LOCAL_UID:-8001}
GROUP_ID=${LOCAL_GID:-8001}

echo "Starting with USER: $USER_NAME, GROUP: $GROUP_NAME, UID : $USER_ID, GID: $GROUP_ID"

groupadd -g $GROUP_ID $GROUP_NAME
useradd -u $USER_ID -o -m $USER_NAME -g $GROUP_NAME
export HOME=/home/$USER_NAME

if [ ! -L $HOME/dev ]; then
    ln -s /var/opt/dev/ $HOME/dev
fi

exec /usr/sbin/gosu $USER_NAME "$@"
