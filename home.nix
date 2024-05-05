{ ... }:

{
  imports = [
    ./home/helix.nix
  ];
  home.username = "marty";
  home.homeDirectory = "/home/marty";

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "Alacritty.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,close";
      num-workspaces = 1;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "alacritty";
      command = "alacritty";
      binding = "<Super>T";
    };
  };
  # Packages that should be installed to the user profile.
  # home.packages = with pkgs; [];

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
        };
        selection.save_to_clipboard = true;
      };
    };

    nushell = {
      enable = true;
      # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
      #configFile.source = ./.../config.nu;
      # for editing directly to config.nu 
      extraConfig = ''
        $env.config = {
         show_banner: false,
         completions: {
         case_sensitive: false # case-sensitive completions
         quick: true    # set to false to prevent auto-selecting completions
         partial: true    # set to false to prevent partial filling of the prompt
         algorithm: "fuzzy"    # prefix or fuzzy
         }
        } 
      '';
      shellAliases = { };
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

  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
