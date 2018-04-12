#!/bin/bash
# profiles = profile_not_found

yum install -y audit audispd-plugins

REMOTE_SERVER_REGEX="^remote_server[[:space:]]*=.*$"
if grep -q "$REMOTE_SERVER_REGEX" /etc/audisp/audisp-remote.conf; then
        sed -i "s/$REMOTE_SERVER_REGEX/remote_server = some.resolvable-hostname.com/" /etc/audisp/audisp-remote.conf
else
        echo "remote_server = some.resolvable-hostname.com" >> /etc/audisp/audisp-remote.conf
fi
