# Defines the central option schema for the dendritic pattern.
# Feature files write into these options; modules/hosts.nix reads them to build nixosConfigurations.
{ lib, ... }:
{
  options.marty = {
    # Global module lists (applied to ALL hosts)
    nixosModules = lib.mkOption {
      type = lib.types.listOf lib.types.deferredModule;
      default = [ ];
      description = "NixOS configuration modules applied to every host.";
    };

    homeModules = lib.mkOption {
      type = lib.types.listOf lib.types.deferredModule;
      default = [ ];
      description = "Home-manager modules applied to every host.";
    };

    # Named optional feature bundles — hosts declare which ones they want
    features = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          nixosModules = lib.mkOption {
            type = lib.types.listOf lib.types.deferredModule;
            default = [ ];
          };
          homeModules = lib.mkOption {
            type = lib.types.listOf lib.types.deferredModule;
            default = [ ];
          };
        };
      });
      default = { };
      description = "Named feature bundles. Hosts declare which features they use.";
    };

    # Host definitions
    hosts = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          hardwareConfig = lib.mkOption {
            type = lib.types.path;
            description = "Path to hardware-configuration.nix for this host.";
          };
          features = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ ];
            description = "List of feature names from marty.features to enable.";
          };
          extraNixosModules = lib.mkOption {
            type = lib.types.listOf lib.types.deferredModule;
            default = [ ];
            description = "Additional NixOS modules unique to this host.";
          };
          extraHomeModules = lib.mkOption {
            type = lib.types.listOf lib.types.deferredModule;
            default = [ ];
            description = "Additional home-manager modules unique to this host.";
          };
        };
      });
      default = { };
    };
  };
}
