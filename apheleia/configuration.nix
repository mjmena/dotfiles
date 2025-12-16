{ pkgs, ... }:

{
  networking.hostName = "apheleia"; # Define your hostname.

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings.PermitRootLogin = "no";
    knownHosts = {
      hermes.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGCER5LsQDVarvt5/iASmnP6M1lU8mj4ZW4oZxTb8TiU";
      hephaestus.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPAGrfWIpQ/j/fx4KqmsxvKQY1VTKH1XJdOIw929/yhq";
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "martinjxm@gmail.com";
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."mjmena.com" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://localhost:3000";
      };
    };
  };
}
