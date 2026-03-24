{ ... }:
{
  config.marty.nixosModules = [
    ({ pkgs, ... }: {
      users.users.marty = {
        isNormalUser = true;
        description = "marty";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGCER5LsQDVarvt5/iASmnP6M1lU8mj4ZW4oZxTb8TiU marty" # hermes
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPAGrfWIpQ/j/fx4KqmsxvKQY1VTKH1XJdOIw929/yhq marty" # hephaestus
        ];
        shell = pkgs.zsh;
      };

      system.stateVersion = "23.11";
    })
  ];
}
