{
  description = "Marty's NixOS Flake";

  # This is the standard format for flake.nix.
  # `inputs` are the dependencies of the flake,
  # and `outputs` function will return all the build results of the flake.
  # Each item in `inputs` will be passed as a parameter to
  # the `outputs` function after being pulled and built.
  inputs = {
    # There are many ways to reference flake inputs.
    # The most widely used is `github:owner/name/reference`,
    # which represents the GitHub repository URL + branch/commit-id/tag.

    # Official NixOS package source, using nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs =
    { nixpkgs
    , home-manager
    , stylix
    , ...
    } @ inputs:
    let
      shareConfig = hostname:
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
          ];
        };
    in
    {
      nixosConfigurations = {
        hermes = shareConfig "hermes";
        tower = shareConfig "tower";
        hephaestus = shareConfig "hephaestus";
        nixos = shareConfig "hephaestus";
        gaia = nixpkgs.lib.nixosSystem rec {

          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            inherit system;
          };
          modules = [
            ./base.nix
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
