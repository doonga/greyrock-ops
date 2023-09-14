#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 10.1.1.71 -f ./clusterconfig/greyrock-ops-k8s1.greyrock.io.yaml
talosctl apply-config -n 10.1.1.72 -f ./clusterconfig/greyrock-ops-k8s2.greyrock.io.yaml
talosctl apply-config -n 10.1.1.73 -f ./clusterconfig/greyrock-ops-k8s3.greyrock.io.yaml
talosctl apply-config -n 10.1.1.74 -f ./clusterconfig/greyrock-ops-k8s4.greyrock.io.yaml
talosctl apply-config -n 10.1.1.75 -f ./clusterconfig/greyrock-ops-k8s5.greyrock.io.yaml
talosctl apply-config -n 10.1.1.76 -f ./clusterconfig/greyrock-ops-k8s6.greyrock.io.yaml
talosctl apply-config -n 10.1.1.77 -f ./clusterconfig/greyrock-ops-k8s7.greyrock.io.yaml
talosctl apply-config -n 10.1.1.78 -f ./clusterconfig/greyrock-ops-k8s8.greyrock.io.yaml
