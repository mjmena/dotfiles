{ ... }:
{
  imports = [
    ./home/helix.nix
  ];
  home.username = "marty";
  home.homeDirectory = "/home/marty";

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
          startup_mode = "Fullscreen";
        };
        selection.save_to_clipboard = true;
      };
    };

    nushell = {
      enable = true;
      configFile.source = ./home/config.nu;
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

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "Alacritty.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
      num-workspaces = 1;
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = [ ];
      switch-applications-backward = [ ];
      switch-windows = [ "<Super>Tab" "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Super>Tab" "<Shift><Alt>Tab" ];
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
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
