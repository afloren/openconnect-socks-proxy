OpenConnect SOCKS Proxy
=======================

![Docker Stars](https://img.shields.io/docker/stars/afloren/openconnect-socks-proxy.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/afloren/openconnect-socks-proxy.svg)
![Docker Automated](https://img.shields.io/docker/automated/afloren/openconnect-socks-proxy.svg)
![Docker Build](https://img.shields.io/docker/build/afloren/openconnect-socks-proxy.svg)

A containerized service that connects to a Cisvo AnyConnect VPN and provides access to that VPN via a SOCKS proxy using using [OpenConnect](https://github.com/openconnect) and [ocproxy](https://github.com/cernekee/ocproxy).

This is very useful if you'd like to configure only specific applications or websites (e.g., using the Chrome plugin [Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif?hl=en)) to use the VPN while allowing the rest of your traffic to go direct or even through another VPN.

A local docker engine (such as [Docker Desktop](https://www.docker.com/products/docker-desktop)) is required to run the service.

The service can be started by running the following command:
> docker run -it --rm -p 1080:1080 afloren/openconnect-socks-proxy vpn.example.com

This will start the SOCKS proxy on localhost at port 1080 and prompt the user to authenticate with the VPN at `vpn.example.com`.
