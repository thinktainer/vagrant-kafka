#!/usr/bin/env bash
SSH_FILE=/etc/sudoers.d/env_keep_root
if [ ! -f SSH_FILE ];
then
  echo "Keeping auth sock for vagrant user."
  echo 'Defaults:vagrant env_keep += "SSH_AUTH_SOCK"' > $SSH_FILE;
  chmod 0440 $SSH_FILE;
  echo "Done."
fi
echo "Updating system."
yum update > /dev/null
echo "Done."
echo "Installing git"
yum install -y git > /dev/null
echo "Done".

