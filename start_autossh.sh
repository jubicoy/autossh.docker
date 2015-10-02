#!/bin/bash
if [ -z ${AUTOSSH_HOST_STRING+x} ] || \
   [ -z ${AUTOSSH_PRIVATE_KEY+x} ]; then
  echo "ENV unset. Sleeping ..."
  while true; do sleep 1h; done
fi

echo ${AUTOSSH_PRIVATE_KEY} > /autossh_id_rsa
/usr/bin/autossh \
  -M 0 -4 -N \
  ${AUTOSSH_HOST_STRING} \
  ${AUTOSSH_PARAMS} \
  -o "ServerAliveInterval 60" \
  -o "ServerAliveCountMax 3" \
  -o StrictHostKeyChecking=no \
  -i /autossh_id_rsa
