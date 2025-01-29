{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers = {
      jigglybuff = {
        enable = true;
        package = inputs.nix-minecraft.packages.x86_64-linux.quilt-server;

        serverProperties = { /* */ };
        whitelist = { /* */ };


        # Fetching from the internet
        symlinks = {
          mods = pkgs.linkFarmFromDrvs "mods"
            (builtins.attrValues {
              Sodium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/AANobbMI/versions/iPRNybGo/sodium-fabric-0.6.3%2Bmc1.21.4.jar";
                sha256 = "sha256-eXS2aXWhjb/itFVejlAF+YaHQezZQmGTEdVGhWrIG5s=";
              };
              Lithium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/ZSNsJrPI/lithium-fabric-mc1.20.1-0.11.2.jar";
                sha256 = "sha256-oMWVNV1oDgyHv46uuv7f9pANTncajWiU7m0tQ3Tejfk=";
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
            });
        };
      };
    };
  };

  # ...
}
