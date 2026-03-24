{ inputs, ... }:
let
  system = "x86_64-linux";
in
{
  config.marty.features.minecraft.nixosModules = [
    inputs.nix-minecraft.nixosModules.minecraft-servers

    ({ ... }: {
      nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
    })

    ({ ... }: {
      networking.firewall.allowedTCPPorts = [ 8100 ];

      services.minecraft-servers = {
        enable = true;
        eula = true;
        openFirewall = true;

        servers = {
          jigglybuff = {
            enable = true;
            package = inputs.nix-minecraft.packages.${system}.fabric-server;

            serverProperties = {
              view-distance = 32;
            };

            files = inputs.nix-minecraft.lib.collectFiles ../../data/minecraft;
          };
        };
      };
    })
  ];
}
