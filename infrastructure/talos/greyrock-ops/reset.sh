#!/bin/bash

# Reset the worker nodes first since the path to them is through the control plane nodes
# talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.111 -e 10.1.1.1.111
# talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.110 -e 10.1.1.1.110
# talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.109 -e 10.1.1.1.109
# talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.108 -e 10.1.1.1.108
# talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.107 -e 10.1.1.1.107
# talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.106 -e 10.1.1.1.106
# talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.105 -e 10.1.1.1.105
# talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.104 -e 10.1.1.1.104

# echo "Waiting for workers to reset... ^C to stop here"
# sleep 5

# Reset the control plane nodes
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.6 -e 10.1.1.1.6
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.5 -e 10.1.1.1.5
talosctl reset --graceful=false --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot -n 10.1.1.1.4 -e 10.1.1.1.4
