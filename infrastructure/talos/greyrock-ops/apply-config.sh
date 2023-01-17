#!/bin/bash

# Deploy the configuration to the nodes
talosctl apply-config -n 172.16.30.101 -f ./clusterconfig/greyrock-ops-control-01.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.102 -f ./clusterconfig/greyrock-ops-control-02.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.103 -f ./clusterconfig/greyrock-ops-control-03.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.104 -f ./clusterconfig/greyrock-ops-worker-01.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.105 -f ./clusterconfig/greyrock-ops-worker-02.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.106 -f ./clusterconfig/greyrock-ops-worker-03.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.107 -f ./clusterconfig/greyrock-ops-worker-04.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.108 -f ./clusterconfig/greyrock-ops-worker-05.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.109 -f ./clusterconfig/greyrock-ops-worker-06.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.110 -f ./clusterconfig/greyrock-ops-worker-07.private.greyrock.io.yaml
talosctl apply-config -n 172.16.30.111 -f ./clusterconfig/greyrock-ops-worker-08.private.greyrock.io.yaml
