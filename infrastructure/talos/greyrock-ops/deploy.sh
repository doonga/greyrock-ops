#!/bin/bash

# Only need to do this once since the config keys will always be the same
# talosctl --talosconfig=./clusterconfig/talosconfig config endpoint 172.16.30.10
# talosctl config merge ./clusterconfig/talosconfig
# talosctl kubeconfig -n 172.16.30.101

# Deploy the configuration to the nodes
talosctl apply-config -i -n 172.16.30.101 -f ./clusterconfig/greyrock-ops-control-01.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.102 -f ./clusterconfig/greyrock-ops-control-02.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.103 -f ./clusterconfig/greyrock-ops-control-03.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.104 -f ./clusterconfig/greyrock-ops-worker-01.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.105 -f ./clusterconfig/greyrock-ops-worker-02.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.106 -f ./clusterconfig/greyrock-ops-worker-03.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.107 -f ./clusterconfig/greyrock-ops-worker-04.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.108 -f ./clusterconfig/greyrock-ops-worker-05.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.109 -f ./clusterconfig/greyrock-ops-worker-06.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.110 -f ./clusterconfig/greyrock-ops-worker-07.private.greyrock.io.yaml
talosctl apply-config -i -n 172.16.30.111 -f ./clusterconfig/greyrock-ops-worker-08.private.greyrock.io.yaml

echo "Waiting 2 mins..."
sleep 120

echo "Bootstrap..."
talosctl bootstrap -n 172.16.30.101 -e 172.16.30.101

echo "Waiting 3 mins..."
sleep 180

echo "Apply CNI and CSR Approver"
kustomize build --enable-helm | kubectl apply -f -
