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
