#!/usr/bin/env bash
if [[ ! `gem list r10k` ]];
  then
    echo "Installing r10k gem."
    gem install --no-ri --no-rdoc r10k -v 1.4.1
    echo "Done."
  else
    echo "r10k found."
fi

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

echo "Installing modules from Puppetfile."
PUPPETFILE=/puppet/Puppetfile \
PUPPETFILE_DIR=/puppet/modules \
r10k puppetfile install
echo "Done."

