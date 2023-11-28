Upgrade procedure:

Update Talos version in talconfig.yaml
Update Extension versions in talconfig.yaml

Run talhelper genconfig

Upgrade Talos, one node at a time:
talosctl upgrade -n k8s1.greyrock.io --image ghcr.io/siderolabs/installer:v1.5.1 --preserve --stage

Apply new config:
talosctl apply-config -n k8s1.greyrock.io -f ./clusterconfig/greyrock-ops-k8s1.greyrock.io.yaml

Upgrade Talos again, this updates the modules
talosctl upgrade -n k8s1.greyrock.io --image ghcr.io/siderolabs/installer:v1.5.1 --preserve

Validate extensions
talosctl get extensions -n k8s1.greyrock.io
