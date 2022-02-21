## docker-etcd

This is a single node etcd cluster running inside Docker for development purposes.

## Requirements

* Docker
* etcdctl

Run without TLS:

```bash
docker run -p 2379:2379  -it jecklgamis/etcd:latest
etcdctl put some-key some-value
etcdctl get some-key
```

Run with TLS

```bash
docker run -e "ENABLE_TLS=true" -p 2379:2379 -it jecklgamis/etcd:latest
etcdctl --cacert ca.pem --endpoints=https://localhost:2379  put some-key some-value
etcdctl --cacert ca.pem --endpoints=https://localhost:2379  get some-key
```

## Security Materials

The certificates and keys in this repo were generated using `cfssl`.
See [this repo](https://github.com/coreos/docs/blob/master/os/generate-self-signed-certificates.md)
for details.

* ca.pem - the CA certificate used to certify the server certificates below
* server-key.pem - the server key (this has `etcd` as CN and `localhost` as alternative DNS)
* server.pem - the server certificate

View certificates:
```bash
openssl x509 -in server.pem -text -noout
openssl x509 -in ca.pem -text -noout
```

View server certificate from running instance.
```bash
openssl s_client -showcerts -connect localhost:2379 </dev/null
```