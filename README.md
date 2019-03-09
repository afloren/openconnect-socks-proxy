OpenConnect SOCKS Proxy
=======================

A service that connects to a Cisvo AnyConnect VPN using the OpenConnect client (https://github.com/openconnect) and provides access to that VPN via a SOCKS proxy.

This is very useful if you'd like to configure only specific applications or websites (using e.g., Proxy SwitchyOmega) to use the VPN while allowing the rest of your traffic to go direct (or even through another VPN).

The service runs inside a docker container in order to isolate the network traffic, and docker is required to run the service.

The service can be started by running the following command:
> docker-compose run --service-ports openconnect-socks-proxy vpn.example.com

where `vpn.example.com` should be replaced by your desired VPN host.
