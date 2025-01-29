{ pkgs, inputs, ... }:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers =
    let
    in
    {
      enable = true;
      eula = true;
      openFirewall = true;

      servers = {
        jigglybuff = {
          enable = true;
          package = pkgs.quiltServers.quilt-0_9_2;

          serverProperties = { /* */ };
          whitelist = { /* */ };


          # Fetching from the internet
          mods = pkgs.linkFarmFromDrvs "mods"
            (builtins.attrValues {
              Sodium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/AANobbMI/versions/iPRNybGo/sodium-fabric-0.6.3%2Bmc1.21.4.jar";
                sha512 = "";
              };
              Lithium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/ZSNsJrPI/lithium-fabric-mc1.20.1-0.11.2.jar";
                sha512 = "";
              };
              # memory usage optimizer
              FerriteCore = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/uXXizFIs/versions/IPM0JlHd/ferritecore-7.1.1-fabric.jar";
                sha512 = "";
              };
              # network stack optimizer
              C2ME = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/VSNURh3q/versions/Qgg5mpR6/c2me-fabric-mc1.21.4-0.3.2%2Balpha.0.33.jar";
                sha512 = "";
              };
            });
        };
      };
    };

  # ...
}
