{ ... }:

{
  networking.hostName = "hermes"; # Define your hostname.
  networking.firewall.allowedTCPPorts = [ 8080 ];
}
