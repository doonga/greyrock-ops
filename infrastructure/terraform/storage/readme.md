# Terraform Storage

Provisions Kubernetes applications on k3s on my NAS for me

Notes:
After bootstrapping vault:
vault secrets enable -path=secrets -version=2 kv

# Create policies

echo '
  path "secrets/*" {
    capabilities = ["read", "create", "update"]
  }' | vault policy write external-secrets-operator -

echo '
  path "secrets/*" {
    capabilities = ["read"]
  }' | vault policy write terraform -

echo '
  path "sys/storage/raft/snapshot" {
     capabilities = ["read"]
  }' | vault policy write snapshot -

# Create tokens
vault token create -policy=external-secrets-operator -period=8640h
vault token create -policy=terraform -period=8640h
vault token create -policy=snapshot -period=8640h
