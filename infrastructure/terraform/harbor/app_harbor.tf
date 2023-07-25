resource "helm_release" "harbor" {
  name       = "harbor"
  repository = "https://helm.goharbor.io"
  chart      = "harbor"
  version    = "v1.12.2"

  values = [
    templatefile("values/harbor.yaml", { secretKey = "${module.onepassword_item_harbor.fields.secret-key}"})
  ]
}

resource "kubernetes_manifest" "harbor_https" {
  manifest = {
    "apiVersion" = "traefik.containo.us/v1alpha1"
    "kind"       = "IngressRouteTCP"
    "metadata" = {
      "name"      = "harbor-https"
      "namespace" = "default"
    }
    "spec" = {
      "routes" = [{
        "match" = "HostSNI(`harbor.greyrock.io`)"
        "kind" = "Rule",
        "services" = [{
          "name" = "harbor",
          "port" = "443"
        }]
      }]
      "tls" = {
        "passthrough" = "true"
      }
    }
  }
}

# TO DO: https://letsdocloud.com/2021/02/setup-harbor-registry-with-traefik-as-ingress-controller-with-letsencrypt-certificate/ -- Add Entrypoints and redirect middleware

# resource "kubernetes_manifest" "harbor_http" {
#   manifest = {
#     "apiVersion" = "traefik.containo.us/v1alpha1"
#     "kind"       = "IngressRoute"
#     "metadata" = {
#       "name"      = "harbor-http"
#       "namespace" = "default"
#     }
#     "spec" = {
#       "routes" = [{
#         "match" = "HostSNI(`harbor.greyrock.io`)"
#         "kind" = "Rule",
#         "services" = [{
#           "name" = "harbor",
#           "port" = "80"
#         }]
#         "middleware" = [{
#           "name" = "redirect"
#           "namespace" = "kube-system"
#         }]
#       }]
#     }
#   }
# }

# resource "kubernetes_manifest" "harbor_4443" {
#   manifest = {
#     "apiVersion" = "traefik.containo.us/v1alpha1"
#     "kind"       = "IngressRouteTCP"
#     "metadata" = {
#       "name"      = "harbor-4443"
#       "namespace" = "default"
#     }
#     "spec" = {
#       "routes" = [{
#         "match" = "HostSNI(`harbor.greyrock.io`)"
#         "kind" = "Rule",
#         "services" = [{
#           "name" = "harbor",
#           "port" = "4443"
#         }]
#       }]
#       "tls" = {
#         "passthrough" = "true"
#       }
#     }
#   }
# }
