# Reads marty.hosts definitions and produces flake.nixosConfigurations.
{ config, inputs, ... }:
let
  inherit (inputs) nixpkgs home-manager nixvim;
  system = "x86_64-linux";

  collectNixosModules = hostCfg:
    config.marty.nixosModules
    ++ (builtins.concatMap
      (feat: config.marty.features.${feat}.nixosModules)
      hostCfg.features)
    ++ hostCfg.extraNixosModules;

  collectHomeModules = hostCfg:
    config.marty.homeModules
    ++ (builtins.concatMap
      (feat: config.marty.features.${feat}.homeModules)
      hostCfg.features)
    ++ hostCfg.extraHomeModules;
in
{
  config.flake.nixosConfigurations =
    builtins.mapAttrs (hostname: hostCfg:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          (collectNixosModules hostCfg)
          ++ [
            hostCfg.hardwareConfig
            { networking.hostName = hostname; }

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.marty = { ... }: {
                imports = collectHomeModules hostCfg;
                home.username = "marty";
                home.homeDirectory = "/home/marty";
                home.stateVersion = "23.11";
                programs.home-manager.enable = true;
              };
            }

            nixvim.nixosModules.nixvim
          ];
      }
    ) config.marty.hosts;
}
