#!/bin/bash

# Only need to do this once since the config keys will always be the same
# talosctl --talosconfig=./clusterconfig/talosconfig config endpoint 10.5.0.2
# talosctl config merge ./clusterconfig/talosconfig
# talosctl kubeconfig -n 10.5.0.2

# Deploy the configuration to the nodes
talosctl apply-config -i -n 10.1.1.4 -f ./clusterconfig/greyrock-ops-k8s1.greyrock.io.yaml
talosctl apply-config -i -n 10.1.1.5 -f ./clusterconfig/greyrock-ops-k8s2.greyrock.io.yaml
talosctl apply-config -i -n 10.1.1.6 -f ./clusterconfig/greyrock-ops-k8s3.greyrock.io.yaml
talosctl apply-config -i -n 10.1.1.7 -f ./clusterconfig/greyrock-ops-k8s4.greyrock.io.yaml
talosctl apply-config -i -n 10.1.1.8 -f ./clusterconfig/greyrock-ops-k8s5.greyrock.io.yaml
talosctl apply-config -i -n 10.1.1.9 -f ./clusterconfig/greyrock-ops-k8s6.greyrock.io.yaml

echo "Config applied"
echo "Waiting 2 mins..."
sleep 120

echo "Bootstrap..."
talosctl bootstrap -n 10.1.1.4 -e 10.1.1.4

echo "Waiting 3 mins..."
sleep 180

echo "Apply CNI and CSR Approver"
kustomize build --enable-helm | kubectl apply -f -
