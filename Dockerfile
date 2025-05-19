FROM debian:bullseye-slim

# Install tailscale and dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg apt-transport-https ca-certificates && \
    curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.gpg | apt-key add - && \
    curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.list | tee /etc/apt/sources.list.d/tailscale.list && \
    apt-get update && \
    apt-get install -y tailscale ssh

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run the startup script
ENTRYPOINT ["/entrypoint.sh"]
