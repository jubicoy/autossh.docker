#!/bin/bash
if [ -z ${AUTOSSH_HOST_STRING+x} ] || \
   [ -z ${AUTOSSH_PRIVATE_KEY+x} ]; then
  echo "ENV unset. Sleeping ..."
  while true; do sleep 1h; done
fi

ID_RSA="/autossh_id_rsa"
echo ${AUTOSSH_PRIVATE_KEY} > ${ID_RSA}
sed -i 's/\\n/\n/g' ${ID_RSA}
chmod 600 ${ID_RSA}
/usr/bin/autossh \
  -M 0 -4 -N \
  ${AUTOSSH_HOST_STRING} \
  ${AUTOSSH_PARAMS} \
  -o "ServerAliveInterval 60" \
  -o "ServerAliveCountMax 3" \
  -o StrictHostKeyChecking=no \
  -i /autossh_id_rsa
