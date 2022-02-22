## docker-etcd

This is a single node etcd cluster running inside Docker.

## Requirements

* Docker
* etcdctl

Running without TLS:

```bash
docker run -p 2379:2379  -it jecklgamis/etcd:latest
etcdctl put some-key some-value
etcdctl get some-key
```

Running with TLS:

```bash
docker run -e "ENABLE_TLS=true" -p 2379:2379 -it jecklgamis/etcd:latest
etcdctl --cacert ca.pem --endpoints=https://localhost:2379  put some-key some-value
etcdctl --cacert ca.pem --endpoints=https://localhost:2379  get some-key
```

# Security Materials

The dummy certificates and keys in this repo were generated using `cfssl`.
See [this repo](https://github.com/coreos/docs/blob/master/os/generate-self-signed-certificates.md)
for details. 

* ca.pem - the CA certificate used to certify the server key pair below
* server-key.pem - the server private key
* server.pem - the server certificate (this has `etcd` as CN and `localhost` as alternate DNS)

The files are copied to the `/etcd` directory (see Dockerfile).

View certificates:

```bash
openssl x509 -in server.pem -text -noout
openssl x509 -in ca.pem -text -noout
```

View server certificate from running instance

```bash
openssl s_client -showcerts -connect localhost:2379 </dev/null
```