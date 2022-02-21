#!/bin/bash
cd /etcd
if [ "${ENABLE_TLS}" == "true" ]; then
  echo "Running with TLS "
  exec ./etcd --name infra0 --data-dir infra0   --log-level warn --cert-file server.pem --key-file server-key.pem  \
  --advertise-client-urls=https://0.0.0.0:2379 --listen-client-urls=https://0.0.0.0:2379
else
  echo "Running without TLS"
  exec ./etcd --name infra0 --data-dir infra0 --log-level warn  --advertise-client-urls=http://0.0.0.0:2379 --listen-client-urls=http://0.0.0.0:2379
fi