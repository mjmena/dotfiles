{
  inputs,
  system,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./helix.nix
    inputs.ags.homeManagerModules.default
  ];
  home.username = "marty";
  home.homeDirectory = "/home/marty";

  home.file = {
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/home/waybar;
      recursive = true;
    };
    ".config/hypr" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/home/hypr;
      recursive = true;
    };
    ".config/wlogout" = {
      source = config.lib.file.mkOutOfStoreSymlink /etc/nixos/home/wlogout;
      recursive = true;
    };
  };

  programs.ags = {
    enable = true;
  };

  programs = {
    alacritty = {
      enable = true;
      settings = {
        shell = pkgs.lib.getExe inputs.world.packages.${system}.default;
        font = {
          normal.family = "JetBrains Mono Nerd Font Mono";
          normal.style = "Regular";
        };
        selection.save_to_clipboard = true;
      };
    };
  };

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [];
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
