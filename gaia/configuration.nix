{ pkgs, ... }:

{
  networking.hostName = "gaia"; # Define your hostname.  

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings.PermitRootLogin = "no";
  };

  stylix.fonts.sizes = {
    terminal = 18;
  };

  environment.systemPackages = [
    pkgs.superTuxKart
  ];
}
