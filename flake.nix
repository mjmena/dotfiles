{
  description = "Marty's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    beerio = {
      url = "github:mjmena/beerio.js";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      stylix,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      mkSystem =
        hostname: extraModules:
        nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit system;
          };
          modules = [
            ./base.nix
            ./${hostname}/configuration.nix
            ./${hostname}/hardware-configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.marty = import ./home;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit system;
              };
            }
            nixvim.nixosModules.nixvim
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        hermes = mkSystem "hermes" [
          ./gnome.nix
          stylix.nixosModules.stylix
        ];
        hephaestus = mkSystem "hephaestus" [
          ./cosmic-de.nix
        ];
        gaia = mkSystem "gaia" [
          ./modules/minecraft
        ];
        apheleia = mkSystem "apheleia" [
          inputs.beerio.nixosModules.default
          {
            services.beerio.enable = true;
            services.beerio.package = inputs.beerio.packages.${system}.default;
            services.beerio.domain = "mjmena.com";
          }
        ];
      };
    };
}
