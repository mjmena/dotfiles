{ ... }:

{
  networking.hostName = "gaia"; # Define your hostname.  
  networking.firewall.allowedTCPPorts = [ 22 ];

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
  };

  stylix.fonts.sizes = {
    terminal = 18;
  };
}
