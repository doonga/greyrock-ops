#!/bin/bash

# Reset the worker nodes first since the path to them is through the control plane nodes
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 172.16.30.109 -e 172.16.30.109
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 172.16.30.108 -e 172.16.30.108
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 172.16.30.107 -e 172.16.30.107
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 172.16.30.106 -e 172.16.30.106
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 172.16.30.105 -e 172.16.30.105
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 172.16.30.104 -e 172.16.30.104

echo "Waiting for workers to reset... ^C to stop here"
sleep 5

# Reset the control plane nodes
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 172.16.30.103 -e 172.16.30.103
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 172.16.30.102 -e 172.16.30.102
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 172.16.30.101 -e 172.16.30.101
