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
    ghostty.url = "github:ghostty-org/ghostty";
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
      shareConfig =
        hostname:
        nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            inherit system;
          };
          modules = [
            ./base.nix
            ./desktop.nix
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
            stylix.nixosModules.stylix
            nixvim.nixosModules.nixvim
          ];
        };
    in
    {
      nixosConfigurations = {
        hermes = shareConfig "hermes";
        hephaestus = shareConfig "hephaestus";
        gaia = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            inherit system;
          };
          modules = [
            ./base.nix
            ./modules/minecraft
            ./gaia/configuration.nix
            ./gaia/hardware-configuration.nix
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
            stylix.nixosModules.stylix
          ];
        };
      };
    };
}
