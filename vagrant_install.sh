#!/bin/sh

if [ $# != 2 ]; then
  echo "please input \"inventory\" \"private-key\""
  echo "ex) $0 vagrant_ubuntu .vagrant/machines/ubuntu/virtualbox/private_key"
  exit 1
fi

ansible-playbook -i $1 site.yml -u vagrant \
--private-key $2