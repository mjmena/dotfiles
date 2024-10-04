{ config, ... }:
{
  imports = [
    ./helix.nix
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

  programs = {
    alacritty = {
      enable = true;
      settings = {
        shell = "/etc/profiles/per-user/marty/bin/nu";
        font = {
          normal.family = "JetBrains Mono Nerd Font Mono";
          normal.style = "Regular";
        };
        window = {
          opacity = 0.9;
          # startup_mode = "Fullscreen";
        };
        selection.save_to_clipboard = true;
      };
    };

    nushell = {
      enable = true;
      configFile.source = ./config.nu;
      shellAliases = {
        vi = "hx";
        vim = "hx";
        nano = "hx";
        cd = "z";
      };
    };

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };

  };

  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [];
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
