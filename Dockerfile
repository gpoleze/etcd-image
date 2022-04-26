FROM alpine

LABEL author="Gabriel Poleze Ferreira" email="gabriel.poleze@gmail.com"

ARG ETCD_VER="v3.5.1"
ARG ARCH="arm64"
ENV TZ=""

ENV DOWNLOAD_URL=https://github.com/etcd-io/etcd/releases/download

RUN apk add --update-cache curl tar tzdata && \
    rm -f /tmp/etcd-$ETCD_VER-linux-$ARCH.tar.gz && \
    rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test && \
    curl -L $DOWNLOAD_URL/$ETCD_VER/etcd-$ETCD_VER-linux-$ARCH.tar.gz -o /tmp/etcd-$ETCD_VER-linux-$ARCH.tar.gz && \
    mkdir -p /opt/etcd && \
    tar xzvf /tmp/etcd-$ETCD_VER-linux-$ARCH.tar.gz -C /opt/etcd --strip-components=1 && \
    rm -f /tmp/etcd-$ETCD_VER-linux-$ARCH.tar.gz

ENV PATH="$PATH:/opt/etcd"

EXPOSE 2379 2380

WORKDIR /opt/etcd