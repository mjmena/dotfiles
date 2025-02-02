{ pkgs, ... }:

{
  networking.hostName = "gaia"; # Define your hostname.  

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings.PermitRootLogin = "no";
    knownHosts = {
      hermes.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGCER5LsQDVarvt5/iASmnP6M1lU8mj4ZW4oZxTb8TiU";
    };
  };

  stylix.fonts.sizes = {
    terminal = 18;
  };

  environment.systemPackages = [
    pkgs.superTuxKart
  ];
}
