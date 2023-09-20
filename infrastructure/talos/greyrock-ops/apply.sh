#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 10.1.1.4 -f ./clusterconfig/greyrock-ops-k8s1.greyrock.io.yaml
talosctl apply-config -n 10.1.1.5 -f ./clusterconfig/greyrock-ops-k8s2.greyrock.io.yaml
talosctl apply-config -n 10.1.1.6 -f ./clusterconfig/greyrock-ops-k8s3.greyrock.io.yaml
talosctl apply-config -n 10.1.1.7 -f ./clusterconfig/greyrock-ops-k8s4.greyrock.io.yaml
talosctl apply-config -n 10.1.1.8 -f ./clusterconfig/greyrock-ops-k8s5.greyrock.io.yaml
talosctl apply-config -n 10.1.1.9 -f ./clusterconfig/greyrock-ops-k8s6.greyrock.io.yaml
