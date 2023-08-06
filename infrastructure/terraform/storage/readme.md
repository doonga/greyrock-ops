# Terraform Storage

Provisions Kubernetes applications on k3s on my NAS for me

Notes:
After bootstrapping vault:
  vault secrets enable kv  # Enables key/value backend

  Create policy.hcl:

  path "kv/*" {
    capabilities = ["read"]
  }

  vault policy write external-secrets policy.hcl

  vault auth enable jwt    # Enabled jwt authentication

  https://support.hashicorp.com/hc/en-us/articles/12406076771347-Vault-JWT-auth-with-static-keys

  Generate & apply keys for static jwt:
  openssl genrsa -out private_key.pem 2048
  openssl rsa -in private_key.pem -outform PEM -pubout -out public_key.pem
  vault write auth/jwt/config jwt_supported_algs=RS256 jwt_validation_pubkeys=@public_key.pem

  Create JWT auth role
    vault write auth/jwt/role/external-secrets \
    policies="external-secrets" \
    user_claim="sub" \
    role_type="jwt" \
    bound_audiences="https://kubernetes.default.svc.cluster.local"

  Go to jwt.io, change Algorithm from HS 256 to RS 256; Nothing need to be changed from HEADER section; Update "PAYLOAD" data with current "iat" epoch with https://www.epochconverter.com/; Another option is to add another "exp", token expire parameter to a future date. Finished PAYLOAD data should looks like this:
    {
    "aud": "https://kubernetes.default.svc.cluster.local",
    "name": "external-secrets",
    "iat" : 1691292200,
    "exp" : 2638063814,
    "sub": "external-secrets"
    }

  Lastly, copy public key from pubkey_key.pem and private key from private_key.pem into appropriate "VERIFY SIGNATURE" section. After finishing with pasting public and private keys, please make sure that the status for JWT is Signature Verified

  Add JWT:
  vault write auth/jwt/login role=external-secrets jwt=<value from site>
