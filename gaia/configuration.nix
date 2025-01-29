{ ... }:

{
  networking.hostName = "gaia"; # Define your hostname.  
  networking.firewall.allowedTCPPorts = [ 22 ];

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
  };

  stylix.fonts.sizes = {
    terminal = 18;
  };
}
