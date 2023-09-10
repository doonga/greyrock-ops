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
vault token create -policy=external-secrets-operator
vault token create -policy=terraform
vault token create -policy=snapshot

# Create approles
vault auth enable approle

vault write auth/approle/role/external-secrets-operator token_policies="external-secrets-operator" token_ttl=48h token_max_ttl=48h token_num_uses=0 secret_id_num_uses=0
vault read auth/approle/role/external-secrets-operator/role-id
vault write -f auth/approle/role/external-secrets-operator/secret-id

