#!/bin/sh -eux

# create etcd user with home directory
useradd --system --home /etc/etcd.d --create-home --shell /bin/false etcd

# Install etcd
curl -sSL https://storage.googleapis.com/etcd/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -o /tmp/etcd.tar.gz

rm -rf /tmp/etcd && mkdir -p /tmp/etcd
tar xzf /tmp/etcd.tar.gz -C /tmp/etcd --strip-components=1

sudo mv /tmp/etcd/etcd /usr/local/bin/
sudo mv /tmp/etcd/etcdctl /usr/local/bin/

# Create data directory
mkdir -p /var/lib/etcd
chown -R etcd:etcd /var/lib/etcd

# create etcd service
mv "$TMP_FILE_DIR/etcd3.service" /etc/systemd/system/etcd3.service
systemctl daemon-reload