#!/usr/bin/env bash
echo "Adding github to known hosts"
KNOWN_HOSTS=/etc/ssh/ssh_known_hosts
if [ ! -f $KNOWN_HOSTS ];
then
  touch $KNOWN_HOSTS
  chmod 644 $KNOWN_HOSTS
fi;
ssh-keygen -R github.com -f $KNOWN_HOSTS
ssh-keyscan github.com > $KNOWN_HOSTS
echo "Done."


