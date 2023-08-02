## greyrock-ops

greyrock-ops is my homeprod cluster.

## How to bootstrap

Assuming you are in the `greyrock-ops` root folder:

### Flux

#### Install Flux

```sh
kubectl apply --server-side --kustomize ./bootstrap
```

### Apply Cluster Configuration

_These cannot be applied with `kubectl` in the regular fashion due to some files being encrypted with sops_

```sh
sops --decrypt ./bootstrap/age-key.sops.yaml | kubectl apply -f -
kubectl apply -f ./flux/vars/cluster-settings.yaml
```

### Kick off Flux applying this repository

```sh
kubectl apply --server-side --kustomize ./flux/config
```

Notes:

# Only need to do this once since the config keys will always be the same
# talosctl --talosconfig=./clusterconfig/talosconfig config endpoint 10.5.0.2
# talosctl config merge ./clusterconfig/talosconfig
# talosctl kubeconfig -n 10.5.0.2
