resource "kubernetes_secret" "cloudflare_api_token_secret" {
  metadata {
    name = "cloudflare-api-token"
  }

  data = {
    "api-token" = "${module.onepassword_item_cloudflare.fields.cert-manager}"
  }
}

resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.12.2"

  values = [
    "${file("values/cert-manager.yaml")}"
  ]
}

resource "kubernetes_manifest" "clusterissuer_letsencrypt_prod" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "ClusterIssuer"
    "metadata" = {
      "name" = "letsencrypt-prod"
    }
    "spec" = {
      "acme" = {
        "email" = "acme@greyrock.io"
        "privateKeySecretRef" = {
          "name" = "letsencrypt-prod"
        }
        "server" = "https://acme-v02.api.letsencrypt.org/directory"
        "solvers" = [
          {
            "dns01" = {
              "cloudflare" = {
                "apiTokenSecretRef" = {
                  "name" = "cloudflare-api-token",
                  "key" = "api-token"
                }
              }
            }
            "selector" = {
              "dnsZones" = [
                "greyrock.io"
              ]
            }
          },
        ]
      }
    }
  }
}

resource "kubernetes_manifest" "clusterissuer_letsencrypt_staging" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "ClusterIssuer"
    "metadata" = {
      "name" = "letsencrypt-staging"
    }
    "spec" = {
      "acme" = {
        "email" = "acme@greyrock.io"
        "privateKeySecretRef" = {
          "name" = "letsencrypt-staging"
        }
        "server" = "https://acme-staging-v02.api.letsencrypt.org/directory"
        "solvers" = [
          {
            "dns01" = {
              "cloudflare" = {
                "apiTokenSecretRef" = {
                  "name" = "cloudflare-api-token",
                  "key" = "api-token"
                }
              }
            }
            "selector" = {
              "dnsZones" = [
                "greyrock.io"
              ]
            }
          },
        ]
      }
    }
  }
}

resource "kubernetes_manifest" "certificate_harbor_greyrock_io" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Certificate"
    "metadata" = {
      "name"      = "harbor-greyrock-io"
      "namespace" = "default"
    }
     "spec" = {
        "secretName" = "harbor-greyrock-io-tls",
        "issuerRef" = {
          "name" = "letsencrypt-prod",
          "kind" = "ClusterIssuer"
        },
        "commonName" = "harbor.greyrock.io",
        "dnsNames" = ["harbor.greyrock.io"]
      }
  }
}
