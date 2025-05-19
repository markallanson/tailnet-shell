# Tailscale Tailnet Shell (tnsh)
A simple Docker container for accessing your Tailscale tailnet from any device with Docker installed. Perfect for 
when you need quick, secure access to your tailnet.

## Quickstart

```shell
git clone git@github.com:markallanson/tailnet-shell.git
cd tnsh

# Option 1: Authenticate with an authkey
TS_AUTHKEY=tskey-your-auth-key-here docker compose up -d

# Option 2: Authenticate via browser
docker compose up -d
docker compose exec -it tnsh tailscale up
# Follow the URL provided to authenticate

# Access your tailnet
docker compose exec -it tnsh bash
```


## Features

* Persistent Connection: The container establishes and maintains a connection to your tailnet, allowing you to create
  new shells instantly.
* Debian-Based: Built on debian-slim for familiarity and package availability.
* Pre-installed Tools: Includes curl, ssh and other essential utilities for network tasks.
* Persistent State: The compose configuration stores Tailscale state in a Docker volume, so you don't need to 
  re-authenticate after restarting


## Use Cases

* Access your tailnet from anywhere that can run docker.
* SSH into machines on your tailnet.
* Transfer files between your tailnet devices.
* Test connectivity from outside your network.


## Environment Variables

```
TS_AUTHKEY: Your Tailscale authentication key (optional)
```


## Customization

To install additional packages, you can modify the Dockerfile or install them at runtime:

```shell
docker compose exec -it tnsh apt-get update && apt-get install -y your-package
```


## Troubleshooting

* Container starts but can't connect to tailnet: Check your authentication status with 
  `docker compose exec tnsh tailscale status`
* Authentication URL not appearing: Check container logs with docker compose logs


# Security Considerations

1. The container configured using the compose file runs in privileged mode.
2. Your Tailscale authentication key provides access to your tailnet - keep it secure.
