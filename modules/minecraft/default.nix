{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  networking.firewall = {
    allowedTCPPorts = [ 8100 ];
  };

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers = {
      jigglybuff = {
        enable = true;
        package = inputs.nix-minecraft.packages.x86_64-linux.fabric-server;

        serverProperties = {
          view-distance = 32;
        };

        # Fetching from the internet
        symlinks = {
          mods = pkgs.linkFarmFromDrvs "mods"
            (builtins.attrValues {
              Sodium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/AANobbMI/versions/tu8qILqH/sodium-fabric-0.6.6%2Bmc1.21.4.jar";
                sha256 = "sha256-Lt0Dw1YwlFQ9Pz1rlBB+D1hFtoL4QXKO5/jNXVwPjoM=";
              };

              Lithium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/QCuodIia/lithium-fabric-0.14.7%2Bmc1.21.4.jar";
                sha256 = "sha256-JdYfw/d/eY+TBnToy6xo8qAxhkpLztfVbce3P1JelGU=";
              };
              # memory usage optimizer
              FerriteCore = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/uXXizFIs/versions/IPM0JlHd/ferritecore-7.1.1-fabric.jar";
                sha256 = "sha256-DdXpIDVSAk445zoPW0aoLrZvAxiyMonGhCsmhmMnSnk=";
              };
              # network stack optimizer
              C2ME = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/VSNURh3q/versions/Qgg5mpR6/c2me-fabric-mc1.21.4-0.3.2%2Balpha.0.33.jar";
                sha256 = "sha256-ejpGXyGpLY8K5N4JsjA4teH8ilbZdhKE2nm1XzfMHSc=";
              };
              # map builder with website at 8100
              BlueMap = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/swbUV1cr/versions/Mvle7bPy/bluemap-5.5-fabric.jar";
                sha256 = "sha256-/fwlSgI3bOjRdo6WOu/Rov8ZDc8PLZehtuT2mhAjf9M=";
              };
              # needed for bluemap
              Fabric-API = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/UnrycCWP/fabric-api-0.115.1%2B1.21.4.jar";
                sha256 = "sha256-r7bbPrB0Qhhlv3J3kIPMne3NtOVvqzFVD6VKAN/KkuU=";
              };
            });
        };
        files = inputs.nix-minecraft.lib.collectFiles ./.;
      };
    };
  };
}

