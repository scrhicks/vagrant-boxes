#!/bin/bash -eux

### INSTALL REQUIRED SOFTWARE
if [[ ! $(command -v curl) || ! $(command -v unzip) || ! $(command -v jq) ]]; then
  apt-get update
  apt-get install -y curl unzip jq
fi

### INSTALL VAULT
curl -sSL https://releases.hashicorp.com/vault/$VAULT_VERSION/vault_${VAULT_VERSION}_linux_amd64.zip -o /tmp/vault_${VAULT_VERSION}.zip
unzip -q -o /tmp/vault_$VAULT_VERSION.zip -d /usr/local/bin/

chmod +x /usr/local/bin/vault
setcap cap_ipc_lock=+ep /usr/local/bin/vault

### CREATE USER WITH HOME AND DATA DIRECTORY
useradd --system --home /etc/vault.d --create-home --shell /bin/false vault
if [[ ! -d /var/lib/vault ]]; then
  mkdir -p /var/lib/vault
  chown -R vault:vault /var/lib/vault
fi

### COPY VAULT CONFIG AND SERVICE
mv "$TMP_FILE_DIR/vault.hcl" /etc/vault.d/vault.hcl
mv "$TMP_FILE_DIR/vault.service" /etc/systemd/system/vault.service

systemctl daemon-reload
systemctl enable vault.service
systemctl start vault.service

echo "Waiting vault to launch on 8200..."
while ! nc -z 127.0.0.1 8200; do   
  sleep 0.1
done

mkdir -p /etc/vault.d/{tokens,unseal-keys}
pushd /etc/vault.d

vaultStatus='$(vault operator init -address=http://127.0.0.1:8200 -status)'
if [[ "$vaultStatus" != "Vault is initialized" ]]; then
  echo "Exporting vault keys..."
  result=$(vault operator init -address=http://127.0.0.1:8200 -key-shares="$VAULT_KEY_SHARES" -key-threshold="$VAULT_kEY_THRESHOLD" -format json)
  
  echo "$result" | jq --raw-output '.root_token' > ./tokens/root.token
  
  for (( i=0; i<$VAULT_KEY_SHARES; i++ )); do
    unsealToken=$(echo "$result" | jq --raw-output .unseal_keys_hex[$i])
    echo "$unsealToken" > ./unseal-keys/unseal-$i.key
  done
fi