#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 10.1.1.4 -f ./clusterconfig/main-k8s1.greyrock.io.yaml
talosctl apply-config -n 10.1.1.5 -f ./clusterconfig/main-k8s2.greyrock.io.yaml
talosctl apply-config -n 10.1.1.6 -f ./clusterconfig/main-k8s3.greyrock.io.yaml
