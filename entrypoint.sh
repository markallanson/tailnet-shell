#!/bin/bash

# Start the tailscale daemon
tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &

# Wait for the daemon to start up
sleep 5

# Try to authenticate if an auth key is provided
if [ -n "$TS_AUTHKEY" ]; then
  tailscale up --authkey="$TS_AUTHKEY" --hostname="docker-$(hostname)"
else
  echo "No auth key provided. To authenticate manually, run: tailscale up"
fi

# Keep the container running
exec sleep infinity

