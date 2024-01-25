{ config, pkgs, ... }:

{
  # TODO please change the username & home direcotry to your own
  home.username = "marty";
  home.homeDirectory = "/home/marty";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # ...
  dconf.settings = {
    # ...
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "Alacritty.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };
    "org/gnome/desktop/wm/prefereneces".button-layout = "maximize, close";
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "Main" ];
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
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "mjmena";
    userEmail = "martinjxm@gmail.com";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

      ];

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

programs.alacritty = {
    enable = true;
    settings = {
      shell = "/run/current-system/sw/bin/fish";
      window = {
        opacity = 0.9;
      };
      selection.save_to_clipboard = true;
    };
};

  home.stateVersion = "23.11";

# Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
