FROM ubuntu:22.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y curl dumb-init && rm -rf /var/lib/apt/lists/*

ENV ETCD_VERSION=v3.5.8
ENV GOOGLE_URL=https://storage.googleapis.com/etcd
ENV GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
ENV DOWNLOAD_URL=${GOOGLE_URL}

WORKDIR /etcd
RUN curl -L ${DOWNLOAD_URL}/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -o etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
    && tar xzvf etcd-${ETCD_VERSION}-linux-amd64.tar.gz --strip-components=1 \
    && rm -f etcd-${ETCD_VERSION}-linux-amd64.tar.gz

COPY server.pem /etcd
COPY server-key.pem /etcd

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
COPY docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]

