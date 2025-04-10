# Sidecar firewall

Sidecar container which acts as firewall.

## Default rules

* Forbid all outgoing traffic
* Allow loopback traffic
* Allow incoming traffic from established connections
* Allow DNS requests (53 tcp/udp)
* Allow docker network (-I OUTPUT -d 172.20.0.0/8 -j ACCEPT)

## Configuration

Default configuration is found @ /etc/iptables/rules.default.sh  
Custom configuration goes @ /etc/iptables/rules.custom.sh  

Format is sh script invoking iptables-related commands.

## Example

```bash
docker run --rm -it --cap-add=NET_ADMIN ghcr.io/hasansino/sidecar-firewall:latest
```

```yaml
services:
  firewall:
    image: ghcr.io/hasansino/sidecar-firewall:latest
    cap_add:
      - NET_ADMIN # required

  nginx:
    image: nginx:latest
    network_mode: "service:firewall" # required
```
