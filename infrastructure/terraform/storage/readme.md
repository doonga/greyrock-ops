# Terraform Storage

Provisions Kubernetes applications on k3s on my NAS for me

Notes:
After bootstrapping vault:
vault secrets enable -path=secrets -version=2 kv

# create read-only policy for kubernetes

Create temporary policy.hcl and apply it

path "secrets/*" {
  capabilities = ["read"]
}

vault policy write external-secrets-operator policy.hcl

Create token for external-secrets-operator
vault token create -policy=external-secrets-operator -period=8640h

