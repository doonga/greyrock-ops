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
  }

  path "/auth/token/create" {
    capabilities = ["create", "update"]
  }' | vault policy write terraform -

echo '
  path "sys/storage/raft/snapshot" {
     capabilities = ["read"]
  }' | vault policy write snapshot -

# Create tokens
vault token create -policy="snapshot" -period=7d -format=json | jq -r ".auth.client_token" > periodic_token.txt

# Create approles
vault auth enable approle

# External Secrets
vault write auth/approle/role/external-secrets-operator token_policies="external-secrets-operator" token_ttl=48h token_max_ttl=48h token_num_uses=0 secret_id_num_uses=0
vault read auth/approle/role/external-secrets-operator/role-id
vault write -f auth/approle/role/external-secrets-operator/secret-id

# TF Controller
vault write auth/approle/role/terraform token_policies="terraform" token_ttl=48h token_max_ttl=48h token_num_uses=0 secret_id_num_uses=0
vault read auth/approle/role/terraform/role-id
vault write -f auth/approle/role/terraform/secret-id
