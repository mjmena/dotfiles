{ ... }:
{
  config.marty.nixosModules = [
    ({ ... }: {
      networking.networkmanager.enable = true;
      networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 8080 ];
      };
    })
  ];
}
