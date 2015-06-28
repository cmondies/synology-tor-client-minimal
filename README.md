# synology-tor-client-minimal

Tor client (Socks proxy ) version 0.2.6.9 - 12MB image - Tor client image qualified for Docker on Synology NAS. This Docker image launch a Tor client with a Socks proxy on port 9150 (SocksPort 0.0.0.0:9150). The proxy is opened for hosts on the local network with 192.168.1.X IP (SocksPolicy accept 192.168.1.0/24).

https://registry.hub.docker.com/u/cmondies/synology-tor-client-minimal/

### Versions

OS : Alpine Linux 3.2 - [http://alpinelinux.org](http://alpinelinux.org) - Alpine Linux is a security-oriented, lightweight Linux distribution based on musl libc and busybox.

Tor : version 0.2.6.9

### Install

1. In the Synology NAS admin interface, launch Docker package
2. In the registry tab, search for the image (search for "tor client") and double click to download
3. When the download is finished, in the image tab, select the tor-client image and launch to create the container.
4. Choose a container name and add port settings : local port (9150) and container port (9150)
5. Click "Next" and adjust ressource limitation if you want. Click "Next" then click "Apply"
6. Launch the container.
7. To use, configure your browser/client to use a SOCKS server with the IP of the NAS and server port: 9150. (Use TorBrowser and change connection settings in preferences panel)
8. Your Tor client is running.

### Configuration : /etc/tor/torrc 

```
## The directory for keeping all the keys/etc
DataDirectory /var/lib/tor

## Tor opens a socks proxy on port 9150
SocksPort 0.0.0.0:9150

## Entry policies to allow/deny SOCKS requests based on IP address.
SocksPolicy accept 192.168.1.0/24
SocksPolicy reject *

## Logs go to stdout at level "notice"
Log notice stdout

# Try for at most NUM seconds when building circuits. If the circuit isn't open in that time, give up on it. (Default: 1 minute.)           
CircuitBuildTimeout 5                                                                                                                       
# Send a padding cell every N seconds to keep firewalls from closing our connections while Tor is not in use.                               
KeepalivePeriod 60                                                                                                                          
# Force Tor to consider whether to build a new circuit every NUM seconds.                                                                   
NewCircuitPeriod 120                                                                                                                        
# How many entry guards should we keep at a time?                                                                                           
NumEntryGuards 8
```

